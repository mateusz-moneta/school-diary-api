class AssignmentsController < ApplicationController
  after_action :authorized

  def index
    render json: {
      data: Assignment
        .left_outer_joins(:class_unit, :user)
        .select('assignments.id, class_units.name, users.first_name, users.last_name, assignments.created_at, assignments.updated_at')
        .paginate(:page => params[:page], :per_page => params[:limit]),
      records_count: Assignment.count
    }
  end

  def create
    @assignment = Assignment.new
    @assignment.class_unit = ClassUnit.find(params[:class_unit_id])
    @assignment.user = Student.find(params[:student_id])

    if @assignment.save
      return render json: {
        id: @assignment.id,
        name: @assignment.class_unit.name,
        first_name: @assignment.user.first_name,
        last_name: @assignment.user.last_name,
        created_at: @assignment.created_at,
        updated_at: @assignment.updated_at
      },
      status: :created,
      location: @assignment
    end

    return render json: @assignment.errors, status: :unprocessable_entity

    render json: { errorKey: 'CLASS_UNIT_OR_STUDENT_NOT_FOUND' }, status: :unprocessable_entity
  end

  def destroy
    if Assignment.exists?(params[:id])
      Assignment.find(params[:id]).destroy
      return render json: { id: params[:id] }
    end

    render json: { errorKey: 'ASSIGNMENT_NOT_FOUND' }, status: :unprocessable_entity
  end

  def show
    render json: Assignment.find(params[:id])
  end

  def update
    if Assignment.exists?(params[:id])
      @assignment = Assignment.find(params[:id])
      @assignment.class_unit = Student.find(params[:class_unit_id])
      @assignment.user = Student.find(params[:student_id])
      @assignment.update

      return render json: @assignment
    end

    render json: { errorKey: 'ASSIGNMENT_NOT_FOUND' }, status: :unprocessable_entity
  end
end
