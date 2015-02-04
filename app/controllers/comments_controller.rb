class CommentsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = Micropost.find params[:micropost_id]
    @comment =  @micropost.comments.build(content: comment_params[:content], user: current_user)
    @comment.save

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @micropost = Micropost.find @comment.micropost_id
    @comment.destroy

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
    
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
  
end
