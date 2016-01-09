class BasketsController < ApplicationController
  def index
    @baskets = Basket.all
  end

  def show
    @basket = Basket.find(params[:id])
  end

  def new
    @basket = Basket.new
    @basket.basket_items.build if @basket.basket_items.blank?
    us_state_list
  end

  def create
    @basket = Basket.new(basket_params)
    us_state_list
    if @basket.save
      redirect_to @basket, notice: 'Basket was successfully created.' 
    else
      render :new 
    end
  end
  
  private

  def basket_params
    params.require(:basket).permit(:customer_location ,:basket_items_attributes => ["id", "basket_id", "product_category", "description", "price", "quantity", "amount", "_destroy"])
  end
  
  def us_state_list
    @states = []
    US_States.each do |code, name| 
      @states << [name, code]
    end
  end
end
