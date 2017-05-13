class PageController < ApplicationController
  def index
    @products = Product.order('updated_at DESC').limit(3)
  end

  def designer_info
    @designer = Designer.find(params[:id])
  end

  def products
    @products = Product.order('updated_at DESC').page params[:page]
  end

  def product_info
    @product = Product.find(params[:id])
  end

  def topics
    @topics = Topic.order('updated_at DESC').page params[:page]
  end

  def topic_info
    @topic = Topic.find(params[:id])
  end
end