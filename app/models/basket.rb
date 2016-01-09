class Basket < ActiveRecord::Base
  has_many :basket_items, :dependent => :destroy
  accepts_nested_attributes_for :basket_items
  
  validates :customer_location, :presence => true
  
  after_validation :set_calculated_fields
  
  def generate_txn_id
    "T"+Time.now.to_i.to_s
  end
  
  def basket_sub_total
    self.basket_items.collect{|bt| bt.item_total}.sum
  end
  
  def basket_tax_total
    self.basket_items.collect{|bt| bt.item_tax(self.customer_location)}.sum
  end
  
  def basket_total_amount
    self.basket_sub_total + self.basket_tax_total
  end
  
  def set_calculated_fields
    self.transaction_id = generate_txn_id
    self.sub_total = basket_sub_total
    self.tax_total = basket_tax_total
    self.total_amount = self.sub_total + self.tax_total
  end
  
end
