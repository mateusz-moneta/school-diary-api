require 'jwt'

class UserController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def list
    @users = User
      .left_outer_joins(:user_type)
      .select("users.id, users.first_name, users.last_name, users.email, user_types.name")

    if params[:user_type]
      return render json: @users.where(:user_types => { name: params[:user_type] }).all
    end

    return render json: @users.all
  end

  def login
    @user = User
      .left_outer_joins(:user_type)
      .find_by({ email: params[:email], password: params[:password] })

    if @user
      token = encode_token({ user_id: @user.id })

      return render json: {
        user: { id: @user.id, first_name: @user.first_name, last_name: @user.last_name, user_type: @user.user_type.name },
        token: token
      }
    end

    return render json: { errorKey: 'USER_HAS_NOT_EXIST' }, status: :unprocessable_entity
  end

  def register
    if User.exists?({ email: params[:email] })
      return render json: { errorKey: 'USER_ALREADY_EXIST' }, status: :unprocessable_entity
    end

    @user = User.new(register_params)
    @user.user_type = UserType.find_by name: params[:user_type]

    if @user.save
      return render json: {
        user: { id: @user.id, first_name: @user.first_name, last_name: @user.last_name, user_type: @user.user_type.name }
      }
    end
  end

  def auto_login
    render json: @user
  end

  private

  def register_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
