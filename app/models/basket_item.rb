class BasketItem < ActiveRecord::Base
  belongs_to :basket
  
  validates :product_category, :description, :price, :quantity, :presence => true
  
  validates :price, :quantity , numericality: { greater_than: 0 }
  
  after_validation :set_calculated_fields
  
  def self.roundup_to_5_multiple(num)
    #move outside for better reuse
    ((num/0.05).ceil*0.05).round(2)
  end

  def item_total
    self.price * self.quantity if self.quantity.present? and self.price.present?
  end
    
  def get_tax_rate(customer_location)
    tax_rate = 0.0
    if customer_location == "CA" and self.product_category != "Food"
        tax_rate = 9.75
    elsif customer_location == "NJ" and !["Food", "Clothing"].include?(self.product_category)
        tax_rate = 7.0
    end
    tax_rate
  end
  
  def item_tax(customer_location)
    BasketItem.roundup_to_5_multiple(self.item_total * (self.get_tax_rate(customer_location)/100))
  end
  
  def set_calculated_fields
    self.amount = self.item_total
  end
  
end
