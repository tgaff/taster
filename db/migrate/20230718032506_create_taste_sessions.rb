class CreateTasteSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :taste_sessions do |t|
      t.string :name, null: false
      t.string :link_name, index: { unique: true }

      t.timestamps
    end
  end
end
