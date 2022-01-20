class ArticleCategoryResource < JSONAPI::Resource
    belongs_to :article
    belongs_to :category
end