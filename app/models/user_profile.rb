class UserProfile < ApplicationRecord
	belongs_to :user

	validates :user_id, presence: true
	validates :location, format: { with: /[A-Z][a-zA-Z]+,[ ][A-Z]/ }, allow_blank: true
  validates :description, length: { maximum: 14216 }, allow_blank: true
end
