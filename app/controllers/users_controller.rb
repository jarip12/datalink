class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource



  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def create
    ap user_params
    @user = User.new(user_params)
    ap @user

    if @user.save
      redirect_to @user, notice: t('action.created.successfully')
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    ap user_params
    if @user.update(user_params)
      redirect_to @user,  notice: t('action.updated.successfully')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: t('action.destroyed.successfully')
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:street, :city, :province, :district, :mobile, :realname, :username, :email, :password, :password_confirmation)
    end
end
