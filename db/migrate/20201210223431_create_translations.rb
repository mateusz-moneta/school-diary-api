class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.references :translation_key, null: false, foreign_key: true
      t.references :translation_scope, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
