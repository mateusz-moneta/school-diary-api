class LessonPlan < ApplicationRecord
  belongs_to :user
  belongs_to :class_unit
  belongs_to :class_room
  belongs_to :work_day
  belongs_to :lesson_hour
  belongs_to :subject
end
