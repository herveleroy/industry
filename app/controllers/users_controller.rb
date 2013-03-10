class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caterpillar }
    end

  end

  def set_challenge
    if params[:challenge]
      @user = current_user
      @user.current_challenge = params[:challenge]
      @user.save
      redirect_to ideas_path
    end
  end
end
