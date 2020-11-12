class UserController < ApplicationController
  def login
    @user = User
      .left_outer_joins(:user_type)
      .find_by({ email: params[:email], password: params[:password] })

    if (@user)
      session[:current_user] = @user
      return render json: { id: @user.id, user_type: @user.user_type.name }
    end

    return render json: { messageKey: 'USER_HAS_NOT_EXIST' }
  end

  def register
    if (User.find_by({ email: params[:email], password: params[:password] }))
      return render json: { messageKey: 'USER_ALREADY_EXIST' }
    end

    @user = User.new register_params
    if (@user.save)
      return render json: { messageKey: 'USER_HAS_BEEN_CREATED' }
    end
  end

  private
    def register_params
      params.permit(:first_name, :last_name, :email, :password, :user_type_id)
    end
end
