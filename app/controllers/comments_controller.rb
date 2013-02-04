class CommentsController < ApplicationController
   before_filter :get_commentable

  def create
    @comment = Comment.build_from( @commentable, current_user.id, params[:comment][:body] )
    @comment.save
    if params[:type] == "2"
      @parent = Comment.find(params[:comment_id])
      @comment.move_to_child_of(@parent)
    end
  end

  private
    def get_commentable
      class_name = params[:commentable]
      id =  params[:id]
      return @commentable = eval(class_name).find(id)
    end
end
