class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Flitter yo"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
