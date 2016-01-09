require 'rails_helper'

RSpec.describe Basket, type: :model do
  it { should has_many(:basket_items) }
  it { should validate_presence_of(:customer_location) }
end
