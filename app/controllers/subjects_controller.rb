class SubjectsController < ApplicationController
  after_action :authorized

  def index
    render json: {
      data: Subject.paginate(:page => params[:page], :per_page => params[:limit]),
      records_count: Subject.count
    }
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      return render json: @subject, status: :created, location: @subject
    end

    render json: @subject.errors, status: :unprocessable_entity
  end

  def destroy
    if Subject.exists?(params[:id])
      Subject.find(params[:id]).destroy
      return render json: { id: params[:id] }
    end

    render json: { errorKey: 'SUBJECT_NOT_FOUND' }, status: :unprocessable_entity
  end

  def show
    render json: Subject.find(params[:id])
  end

  def update
    if Subject.exists?(params[:id])
      @subject = Subject.find(params[:id])
      @subject.update(subject_params)

      return render json: @subject
    end

    render json: { errorKey: 'SUBJECT_NOT_FOUND' }, status: :unprocessable_entity
  end

  private

  def subject_params
    params.permit(:name, :short_name)
  end
end
