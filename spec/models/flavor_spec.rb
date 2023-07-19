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
end
