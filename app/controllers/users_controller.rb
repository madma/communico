class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(self.user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render "new"
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  # HELPER METHODS

  # implement strong params
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end


end
