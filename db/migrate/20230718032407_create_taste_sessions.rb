class CreateTasteSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :taste_sessions do |t|
      t.string :name
      t.string :link_name

      t.timestamps
    end
  end
end
