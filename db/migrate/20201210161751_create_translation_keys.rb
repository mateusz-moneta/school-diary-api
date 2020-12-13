class CreateTranslationKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :translation_keys do |t|
      t.string :key

      t.timestamps
    end
  end
end
