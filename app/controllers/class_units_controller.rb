class ClassUnitsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    @class_unit = ClassUnit.new(class_params)
    @class_unit.user = Teacher.find(params[:teacher_id])

    if @class_unit.save
      return render json: @class_unit, status: :created, location: @class_unit
    end

    render json: @class_unit.errors, status: :unprocessable_entity
  end

  def destroy
    if ClassUnit.exists?(params[:id])
      ClassUnit.find(params[:id]).destroy
      return render json: { id: params[:id] }
    end

    render json: { errorKey: 'CLASS_NOT_FOUND' }, status: :unprocessable_entity
  end

  def show
    render json: {
      data: ClassUnit.paginate(:page => params[:page], :per_page => params[:limit]),
      records_count: ClassUnit.count
    }
  end

  def update
    if ClassUnit.exists?(params[:id])
      @class_unit = ClassUnit.find(params[:id])
      @class_unit.update(class_params)

      return render json: @class_unit
    end

    render json: { errorKey: 'CLASS_NOT_FOUND' }, status: :unprocessable_entity
  end

  private

  def class_params
    params.permit(:name, :short_name)
  end
end
