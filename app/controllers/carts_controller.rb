class CartsController < ApplicationController


  def show
    @cart = requested_cart
  end

  def checkout
    @cart = requested_cart
    @cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    @cart.update(status: "submitted")

    current_user.current_cart = nil
    current_user.save

    redirect_to cart_path(@cart)
  end



end


  private

  def requested_cart
    @cart ||= Cart.find(params[:id])
  end
