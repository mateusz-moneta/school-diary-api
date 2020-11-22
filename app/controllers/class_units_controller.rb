class ClassUnitsController < ApplicationController
  after_action :authorized

  def index
    render json: {
      data: ClassUnit
        .left_outer_joins(:user)
        .select('class_units.id, class_units.name, users.first_name, users.last_name, class_units.created_at, class_units.updated_at')
        .paginate(:page => params[:page], :per_page => params[:limit]),
      records_count: ClassUnit.count
    }
  end

  def create
    @class_unit = ClassUnit.new(class_params)
    @class_unit.user = Teacher.find(params[:teacher_id])

    if @class_unit.save
      return render json: {
        id: @class_unit.id,
        name: @class_unit.name,
        first_name: @class_unit.user.first_name,
        last_name: @class_unit.user.last_name,
        created_at: @class_unit.created_at,
        updated_at: @class_unit.updated_at
      },
      status: :created,
      location: @class_unit
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
    render json: ClassUnit.find(params[:id])
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
    params.permit(:name)
  end
end
