class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_owner_or_admin, only:[:edit, :update, :destroy]
  def index
    @users = User.order('email')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        flash[:notice] = "User was successfully created!"
        format.html {redirect_to action: :index}
        format.json {render action: :show, status: :created, location: @user}
      else
        format.html {render action: :new}
        format.json {render json: @user.erros, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to users_path, notice: 'User was successfully updated!'}
        format.json {head :no_content}
      else
        format.html {render action: :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User was successfully deleted!"
    redirect_to action: :index
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:display_name, :email, :password, :password_confirmation, :role_ids)
  end

  def is_owner_or_admin
    # if current_user.id != @user.id
    #    flash[:notice] = "You are ONLY modify your own account!"
    #    redirect_to users_url
    # end
    # Rails.logger.debug("is_owner_or_admin: #{!(current_user.id == @user.id || current_user.admin?)}")
    if !(current_user.id == @user.id || current_user.admin?)
       flash[:notice] = "You can ONLY modify your own account!"
       redirect_to users_url
    end

  end
end
