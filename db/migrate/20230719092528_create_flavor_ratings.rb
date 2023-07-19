# frozen_string_literal: true

class CreateFlavorRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :flavor_ratings do |t|
      t.references :sample, null: false, foreign_key: true
      t.references :flavor, null: false, foreign_key: true
      t.integer :flavor_strength, limit: 2, default: 0
      t.references :participant, null: false, foreign_key: true

      t.timestamps

      t.index [:sample_id, :flavor_id, :participant_id], unique: true, name: 'single_flavor_rating_per_sample'
    end
  end
end
