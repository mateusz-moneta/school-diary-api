class LessonHoursController < ApplicationController
  after_action :authorized

  def index
    render json: {
      data: LessonHour.paginate(:page => params[:page], :per_page => params[:limit]),
      records_count: LessonHour.count
    }
  end

  def create
    @lesson_hour = LessonHour.new(lesson_hour_params)

    if @lesson_hour.save
      return render json: @lesson_hour, status: :created, location: @lesson_hour
    end

    render json: @lesson_hour.errors, status: :unprocessable_entity
  end

  def destroy
    if LessonHour.exists?(params[:id])
      LessonHour.find(params[:id]).destroy
      return render json: { id: params[:id] }
    end

    render json: { errorKey: 'LESSON_HOUR_NOT_FOUND' }, status: :unprocessable_entity
  end

  def show
    render json: LessonHour.find(params[:id])
  end

  def update
    if LessonHour.exists?(params[:id])
      @lesson_hour = LessonHour.find(params[:id])
      @lesson_hour.update(lesson_hour_params)

      return render json: @lesson_hour
    end

    render json: { errorKey: 'LESSON_HOUR_NOT_FOUND' }, status: :unprocessable_entity
  end

  private

  def lesson_hour_params
    params.permit(:hour_from, :minute_from, :hour_to, :minute_to)
  end
end
