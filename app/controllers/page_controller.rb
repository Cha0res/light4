class PageController < ApplicationController
  def index
  end


  def products
    @products = Product.page params[:page]
  end

  def product_info
    @product = Product.find(params[:id])
  end
end