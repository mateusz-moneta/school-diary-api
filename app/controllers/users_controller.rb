class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def list
    @users = User

    if params[:type]
      @users = params[:type].classify.constantize
    end

    render json: @users.select('users.id, users.first_name, users.last_name, users.email').all
  end

  def login
    @user = User.find_by({ email: params[:email] })

    if @user && @user.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })

      return render json: {
        user: { id: @user.id, first_name: @user.first_name, last_name: @user.last_name, type: @user.type },
        token: token
      }
    end

    render json: { errorKey: 'USER_HAS_NOT_EXIST' }, status: :unprocessable_entity
  end

  def register
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

  def auto_login
    render json: @user
  end

  private

  def register_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
