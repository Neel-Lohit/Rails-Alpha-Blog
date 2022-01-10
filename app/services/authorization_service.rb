class AuthorizationService

    def initialize(headers = {})
      @headers = headers
    end
  
    def call
        user
    end

    def authenticate_request!
      verify_token
    end
  
    private

    attr_reader :headers

    def user
        @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
        @user || errors.add(:token, 'Invalid token') && nil
    end
  
    def http_token
      if @headers['Authorization'].present?
        @headers['Authorization'].split(' ').last
    #   else
    #     errors.add(:token, 'Missing token')
      end
      nil
    end
  
    def verify_token
        @decoded_auth_token ||= JsonWebToken.verify(http_token)
    end
  
end