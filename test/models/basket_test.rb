require 'test_helper'

class BasketTest < ActiveSupport::TestCase
  test "should not save basket without customer location" do
    basket = Basket.new
    assert_not basket.save
    basket.customer_location = 'Test'
    assert basket.save
  end
end
