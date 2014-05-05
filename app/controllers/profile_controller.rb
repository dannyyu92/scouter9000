class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    respond_to do |format|
      format.json do
        render :json => {users: @users}
      end
    end
  end

  def show
    @user = User.where(id: params[:id])
     respond_to do |format|
      format.json do
        render :json => {users: @user}
      end
    end   
  end
end