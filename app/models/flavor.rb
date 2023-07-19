# == Schema Information
#
# Table name: flavors
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Flavor < ApplicationRecord
  extend Mobility
  translates :name, type: :string

end
