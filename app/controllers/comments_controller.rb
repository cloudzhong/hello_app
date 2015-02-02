class CommentsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = Micropost.find params[:micropost_id]
    
    logger.debug "***************micropost #{@micropost.attributes.inspect}"
    
    @comment =  @micropost.comments.build(content: comment_params[:content], user: current_user)
    
    logger.debug "***************comment #{@comment.attributes.inspect}"

    if @comment.save
      flash[:success] = "Comment created!"
    else
      logger.debug "error in create commet"
    end
    redirect_to request.referrer
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
    
    def correct_user
      redirect_to root_url if @comment.user?current_user
    end
  
end
