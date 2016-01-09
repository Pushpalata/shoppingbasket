require 'rails_helper'

RSpec.describe BasketItem, type: :model do
  it { should belong_to(:basket) }
  it { should validate_presence_of(:product_category) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:quantity) }
end
