class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    before_filter :authenticate_user!, only: :index
    
    def index
      @users = User.all
    end
  
    def show
      @own_page = current_user == @user
    end

  private

    def set_user
      @user = User.find(params[:id])
    end

end
