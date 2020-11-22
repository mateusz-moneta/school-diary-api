class RegistrationsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    if User.exists?({ email: params[:email] })
      return render json: { errorKey: 'USER_ALREADY_EXIST' }, status: :unprocessable_entity
    end

    @user = params[:type].classify.constantize.new(register_params)

    if @user.save
      render json: {
        user: { id: @user.id, first_name: @user.first_name, last_name: @user.last_name, type: @user.type }
      }
    end
  end

  private

  def register_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
