class CreateTranslationScopes < ActiveRecord::Migration[6.0]
  def change
    create_table :translation_scopes do |t|
      t.string :name

      t.timestamps
    end
  end
end
