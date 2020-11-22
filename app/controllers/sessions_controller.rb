class SessionsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
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

  def auto_login
    render json: @user
  end
end
