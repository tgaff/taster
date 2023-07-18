class CreateSamples < ActiveRecord::Migration[7.0]
  def change
    create_table :samples do |t|
      t.references :taste_session, null: false, foreign_key: true
      t.string :name
      t.string :reveal_name, null: false

      t.timestamps
    end
  end
end
