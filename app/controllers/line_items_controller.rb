class LineItemsController < ApplicationController

  def create
    #binding.pry

    if current_cart
      current_cart.add_item(params[:id])
      current_cart.save
    else
      current_user.create_current_cart.add_item(params[:item_id])
      current_user.save
      current_cart.save
    end

    #binding.pry

    redirect_to cart_path(current_cart)
  end

end
