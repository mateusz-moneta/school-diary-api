class UsersController < ApplicationController
  after_action :authorized

  def index
    @users = User

    if params[:type]
      @users = params[:type].classify.constantize
    end

    render json: {
      data:  @users.select('users.id, users.first_name, users.last_name, users.email').paginate(:page => params[:page], :per_page => params[:limit]),
      records_count: @users.count
    }
  end

  def show
    render json: User.find(params[:id])
  end
end
