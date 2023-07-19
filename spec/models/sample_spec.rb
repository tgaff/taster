# frozen_string_literal: true

# == Schema Information
#
# Table name: samples
#
#  id               :bigint           not null, primary key
#  name             :string
#  reveal_name      :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  taste_session_id :bigint           not null
#
# Indexes
#
#  index_samples_on_taste_session_id  (taste_session_id)
#
# Foreign Keys
#
#  fk_rails_...  (taste_session_id => taste_sessions.id)
#
require 'rails_helper'

RSpec.describe Sample, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
