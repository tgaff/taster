# frozen_string_literal: true

# == Schema Information
#
# Table name: flavor_ratings
#
#  id              :bigint           not null, primary key
#  flavor_strength :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  flavor_id       :bigint           not null
#  participant_id  :bigint           not null
#  sample_id       :bigint           not null
#
# Indexes
#
#  index_flavor_ratings_on_flavor_id       (flavor_id)
#  index_flavor_ratings_on_participant_id  (participant_id)
#  index_flavor_ratings_on_sample_id       (sample_id)
#  single_flavor_rating_per_sample         (sample_id,flavor_id,participant_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (flavor_id => flavors.id)
#  fk_rails_...  (participant_id => participants.id)
#  fk_rails_...  (sample_id => samples.id)
#
class FlavorRating < ApplicationRecord
  MAXIMUM_STRENGTH = 3
  MINIMUM_STRENGTH = 0

  belongs_to :sample
  belongs_to :flavor
  belongs_to :participant

  validates :flavor_strength, numericality: { only_integer: true, in: (MINIMUM_STRENGTH..MAXIMUM_STRENGTH) }

  before_validation :stay_within_limits

  private

  def stay_within_limits
    self.flavor_strength = MAXIMUM_STRENGTH if flavor_strength > MAXIMUM_STRENGTH
    self.flavor_strength = MINIMUM_STRENGTH if flavor_strength < MINIMUM_STRENGTH
  end
end
