class CreateLessonHours < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_hours do |t|
      t.string :hour_from
      t.string :minute_from
      t.string :hour_to
      t.string :minute_to

      t.timestamps
    end
  end
end
