# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe TasteSession, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it "adds link_name" do
    sess = described_class.create!(name: "test")
    sess.reload
    expect(sess.link_name).to match(/test_\d+/)
  end

  context 'when the name already exists as a link_name' do
    before do
      described_class.create!(name: 'test', link_name: 'test')
    end

    it 'appends some numbers' do
      x = described_class.create!(name: 'test')
      expect(x.link_name).to match(/test_\d+/)
    end
  end
end
