# == Schema Information
#
# Table name: taste_sessions
#
#  id         :bigint           not null, primary key
#  link_name  :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_taste_sessions_on_link_name  (link_name) UNIQUE
#
class TasteSession < ApplicationRecord
  has_rich_text :detail
  has_many :samples, dependent: :destroy

  before_create :assign_link_name

  validates :name, presence: true

  def assign_link_name
    return unless link_name.blank?
    self.link_name = name.parameterize.underscore
    return unless self.class.find_by(link_name: self.link_name)
    (1..20).each do |i|
      self.link_name = name.parameterize.underscore + "_#{SecureRandom.rand(10000)}"
      return unless self.class.find_by(link_name: self.link_name)

    end
    raise StandardError.new, "Couldn't find a link name for this record"
  end
end
