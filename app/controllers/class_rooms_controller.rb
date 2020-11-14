class ClassRoomsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    @class_room = ClassRoom.new(class_params)

    if @class_room.save
      return render json: @class_room, status: :created, location: @class_room
    end

    render json: @class_room.errors, status: :unprocessable_entity
  end

  def destroy
    if ClassRoom.exists?(params[:id])
      ClassRoom.find(params[:id]).destroy
      return
    end

    render json: { errorKey: 'CLASS_ROOM_NOT_FOUND' }, status: :unprocessable_entity
  end

  def show
    render json: ClassRoom.all
  end

  def update
    if ClassRoom.exists?(params[:id])
      @class_room = ClassRoom.find(params[:id])
      @class_room.update(class_params)

      return render json: @class_room
    end

    render json: { errorKey: 'CLASS_ROOM_NOT_FOUND' }, status: :unprocessable_entity
  end

  private

  def class_params
    params.permit(:designation, :location, :floor)
  end
end
