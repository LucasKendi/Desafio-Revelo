class Post < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :text, presence: true
    before_save :set_slug, only: [:create, :update]

    def to_param
        "#{slug}"
    end

    def set_slug
        self.slug = title.parameterize
    end
end
