class CreateLessonPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :class_unit, null: false, foreign_key: true
      t.references :class_room, null: false, foreign_key: true
      t.references :work_day, null: false, foreign_key: true
      t.references :lesson_hour, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
