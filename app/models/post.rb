class Post < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :text, presence: true
    after_validation :set_slug, only: [:create, :update]

    def to_param
        "#{slug}"
    end

    def set_slug
        self.slug = title.parameterize
    end
end
