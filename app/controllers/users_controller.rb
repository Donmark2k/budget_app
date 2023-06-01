class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def edit
    # Code for editing a user
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.expenses.delete_all
    @user.destroy
    redirect_to root_path, notice: 'User and related expenses were successfully deleted.'
  end

  def show
    return unless params[:id] == 'sign_out'

    sign_out_and_redirect
  end

  private

  def sign_out_and_redirect
    sign_out current_user
    redirect_to new_user_session_path
  end

  # Use callbacks to share common setup or constraints between actions.

  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
