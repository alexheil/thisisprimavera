class Product < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope -> { order('id DESC') }

  before_save :total_price_calculator
  before_save :should_generate_new_friendly_id?, if: :title_changed?

  def sizes_for_merch
    if self.size.include? ","
      self.size.split(/\s*,\s*/)
    else
      [self.size]
    end
  end

  def colors_for_merch
    if self.colors.include? ","
      self.colors.split(/\s*,\s*/)
    else
      [self.colors]
    end
  end

  def update_quantity
    #self.quantity - 1 after purchase
  end

  private

    def should_generate_new_friendly_id?
      title_changed?
    end

    def total_price_calculator
      self.total_price = base_price + shipping_price
    end

end
