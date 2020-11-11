class CreateUserTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_types do |t|
      t.string :user_type
    end

    UserType.create :user_type => "admin"
    UserType.create :user_type => "standardUser"
  end
end
