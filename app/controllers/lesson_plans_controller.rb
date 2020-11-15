class LessonPlansController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    @lesson_plan = LessonPlan.new
    @lesson_plan.user = Teacher.find(params[:teacher_id])
    @lesson_plan.class_unit = ClassUnit.find(params[:class_unit_id])
    @lesson_plan.class_room = ClassRoom.find(params[:class_room_id])
    @lesson_plan.work_day = WorkDay.find(params[:work_day_id])
    @lesson_plan.lesson_hour = LessonHour.find(params[:lesson_hour_id])
    @lesson_plan.subject = Subject.find(params[:subject_id])

    if @lesson_plan.save
      return render json: @lesson_plan, status: :created, location: @lesson_plan
    end

    render json: @lesson_plan.errors, status: :unprocessable_entity
  end

  def destroy
    if LessonPlan.exists?(params[:id])
      LessonPlan.find(params[:id]).destroy
      return
    end

    render json: { errorKey: 'LESSON_PLAN_NOT_FOUND' }, status: :unprocessable_entity
  end

  def show
    render json: LessonPlan.all
  end

  def update
    if LessonPlan.exists?(params[:id])
      @lesson_plan = LessonPlan.find(params[:id])

      return render json: @lesson_plan
    end

    render json: { errorKey: 'LESSON_PLAN_NOT_FOUND' }, status: :unprocessable_entity
  end
end
