# frozen_string_literal: true

# == Schema Information
#
# Table name: flavors
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Flavor, type: :model do
  let(:flavor) { described_class.new(name: 'tangy') }

  it 'has ko translations' do
    expect(flavor.name_ko).to be nil
    flavor.name_ko = 'asdf'
    expect(flavor.name_ko).to eq 'asdf'
  end

  it 'has ja translations' do
    expect(flavor.name_ja).to be nil
    flavor.name_ja = 'asdf'
    expect(flavor.name_ja).to eq 'asdf'
  end

  describe 'associations' do
    it { should have_many(:flavor_ratings).dependent(:destroy) }
  end

  describe 'validations' do
    before { described_class.new(name: 'tangy').save! }

    it 'enforces a unique name' do
      duplicate = described_class.new(name: 'tangy')
      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:name]).to include('must be unique')
    end
  end
end
