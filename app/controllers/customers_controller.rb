class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @items = Item.all
  end
end