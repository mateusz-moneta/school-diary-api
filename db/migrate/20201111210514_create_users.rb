class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :password
      t.string :email
      t.boolean :is_active
      t.references :user_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
