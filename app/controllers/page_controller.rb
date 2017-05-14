class PageController < ApplicationController
  def index
    @index_page = IndexPage.new
  end

  def designers
    @designers = Designer.order('updated_at DESC').page params[:page]
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

  def stories
    @stories = Story.order('time_node DESC')
  end
end