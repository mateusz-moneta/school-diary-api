class CreateClassRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :class_rooms do |t|
      t.string :designation
      t.string :location
      t.string :string
      t.numeric :floor

      t.timestamps
    end
  end
end
