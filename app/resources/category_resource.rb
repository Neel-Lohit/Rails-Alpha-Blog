class CategoryResource < JSONAPI::Resource
    attributes :name, :created_at
    has_many :article_categories
    has_many :articles, through: :article_categories
end