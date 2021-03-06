class User < ApplicationRecord
	extend FriendlyId
  friendly_id :username, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile

  validates :username, uniqueness: true, length: { maximum: 50 }

  before_save :should_generate_new_friendly_id?, if: :username_changed?
  before_save :no_username
  before_save :downcase_username
  before_save :slug_create

  private

    def should_generate_new_friendly_id?
      username_changed?
    end

    def no_username
      if username.blank?
        self.username = email.split("@").first
      end
    end

    def downcase_username
      self.username = username.downcase
    end

    def slug_create
      self.slug = username if slug.blank?
    end

end
