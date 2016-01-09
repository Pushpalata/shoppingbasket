require 'test_helper'

class BasketItemTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    basket_item = BasketItem.new
    assert_not basket_item.valid?
    assert_equal [:product_category, :description, :price, :quantity], basket_item.errors.keys
  end
end
