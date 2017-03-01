class LineItemsController < ApplicationController

  def create
    if current_cart
      current_cart.add_item(params[:item_id])
    else
      current_user.create_current_cart.add_item(params[:item_id])
      current_user.save
    end
    current_cart.save
    redirect_to cart_path(current_cart)
  end

end
