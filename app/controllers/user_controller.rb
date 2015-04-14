class UserController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_edit_path(@user)
    else
      render :edit, error: "There was an error updating your information"
    end
  end

  def show
    @user = User.find(params[:id])
   end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
