class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :move_to_root,only: [:show]
  def show
    @nickname = current_user.nickname
    @user = User.find(params[:id])
    
  end
end

private

def move_to_root
  unless User.find(params[:id]).id == current_user.id
    redirect_to root_path
  end
end