class SubjectController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    @subject = Subject.create(subject_params)
    return render json: @subject
  end

  def delete
    Subject.find(params[:id]).destroy
  end

  def list
    render json: Subject.all
  end

  def update
    if (Subject.exists?(params[:id]))
      @subject = Subject.find(params[:id])
      @subject.update(subject_params)

      return render json: @subject
    end

    return render json: { errorKey: 'SUBJECT_NOT_FOUND' }
  end

  private

  def subject_params
    params.permit(:name, :short_name)
  end
end
