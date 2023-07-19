# frozen_string_literal: true

# == Schema Information
#
# Table name: participants
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Participant < ApplicationRecord
  validates :name, presence: true
end
