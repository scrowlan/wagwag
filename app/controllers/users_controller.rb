class UsersController < ApplicationController

  def new
    @user = RegularUser.new
  end

  def create
    @user = RegularUser.new(regular_user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def show
    @user = current_user
    @pets = @user.pets
    @schedules = @user.schedules
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email, :first_name, :last_name ]
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end

    def regular_user_params
      accessible = [ :name, :email, :first_name, :last_name, :password, :password_confirmation ]
      params.require(:regular_user).permit(accessible)
    end 
end
