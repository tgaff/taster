# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "taste_sessions/show", type: :view do
  before(:each) do
    assign(:taste_session, TasteSession.create!(
      name: "Name",
      detail: nil,
      link_name: "Link Name"
    ))
    assign(
      :qr,
      '<svg><ellipse cx="200" cy="80" rx="100" ry="50" style="fill:yellow;stroke:purple;stroke-width:2" /></svg>'
    )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Link Name/)
  end
end
