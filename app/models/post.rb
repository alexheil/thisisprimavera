class Post < ApplicationRecord
	extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  default_scope -> { order('id DESC') }

  before_save :should_generate_new_friendly_id?, if: :title_changed?

  private

  	def should_generate_new_friendly_id?
      title_changed?
    end

    def slug_candidates
      [:title, [:title, :author]]
    end
    
end
