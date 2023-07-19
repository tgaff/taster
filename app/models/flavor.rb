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

  validate :name_is_unique

  private

  def name_is_unique
    errors.add(:name, "must be unique") if Flavor.i18n.where(name: name_en).where.not(id: id).any?
  end
end
