class UserController < ApplicationController
  def list
    users = User
      .left_outer_joins(:user_type)
      .select("users.id, users.first_name, users.last_name, users.email, user_types.name")

    if (params[:user_type])
      return render json: users.where(:user_types => { name: params[:user_type] }).all
    end

    return render json: users.all
  end

  def login
    @user = User
      .left_outer_joins(:user_type)
      .find_by({ email: params[:email], password: params[:password] })

    if (@user)
      session[:current_user] = @user
      return render json: { id: @user.id, user_type: @user.user_type.name }
    end

    return render json: { messageKey: 'USER_HAS_NOT_EXIST' }, status: :unprocessable_entity
  end

  def register
    if (User.find_by({ email: params[:email], password: params[:password] }))
      return render json: { messageKey: 'USER_ALREADY_EXIST' }, status: :unprocessable_entity
    end

    @user = User.new register_params
    if (@user.save)
      return render json: @user, status: :created
    end
  end

  private
    def register_params
      params.permit(:first_name, :last_name, :email, :password, :user_type_id)
    end
end
