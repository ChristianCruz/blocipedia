class UserController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit, error: "There was an error updating your information"
    end
  end

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis.all
   end

   def toggle_role
    @user = current_user

    if @user.admin? == 'admin'
      flash[:error] = "User is an admin. No update."
    elsif @user.standard?
      @user.update_attribute(:role, 'premium')
      flash[:notice] = "User switched from standard to premium."
    else
      @user.update_attribute(:role, 'standard')
      flash[:notice] = "User switched from premium to standard."
    end
    redirect_to user_path(current_user)
  end

  def go_public
    @user = current_user
    @user.update_attribute(:role, 'standard')
    flash[:notice] = "User switched from premium to standard."
    redirect_to edit_user_registration_path
  end

  def upgrade
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)

  end
end
