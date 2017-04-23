class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    if @comment.topic_id
      @topic = Topic.find(@comment.topic_id)
      redirect_to topic_path(@topic)
    elsif @comment.product_id
      @product = Product.find(@comment.product_id)
      redirect_to product_path(@product)
    else
      redirect_to topics_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit!
  end
end
