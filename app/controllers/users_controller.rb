class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit, :destroy]

  def index
   @users = User.all
    render component: 'Users', props: { users: @users }
  end

  def new
    @user = User.new
    render component: 'UserNew', props: { user: @user }
  end


  def create
    @user = User.new(user_params)


    if @user.save
      redirect_to users_path
    else
      render component: 'UserNew', props: { user: @user }
    end
  end


  def edit
    render component: "UserEdit", props: { user: @user }
  end


  def update
    if @user.update(user_params)
      redirect_to users_path
    else 
      render component: "UserEdit", props: { user: @user }
    end
  end


  def show
    render component: 'User', props: { user: @user}
  end

  
  def destroy
    @user.destroy
     redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
