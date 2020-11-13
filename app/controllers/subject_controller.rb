class SubjectController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      render json: @subject, status: :created, location: @subject
    end

    return render json: @subject.errors, status: :unprocessable_entity
  end

  def delete
    if Subject.exists?(params[:id])
      Subject.find(params[:id]).destroy
      return
    end

    return render json: { errorKey: 'SUBJECT_NOT_FOUND' }, status: :unprocessable_entity
  end

  def list
    render json: Subject.all
  end

  def update
    if Subject.exists?(params[:id])
      @subject = Subject.find(params[:id])
      @subject.update(subject_params)

      return render json: @subject
    end

    return render json: { errorKey: 'SUBJECT_NOT_FOUND' }, status: :unprocessable_entity
  end

  private

  def subject_params
    params.permit(:name, :short_name)
  end
end
