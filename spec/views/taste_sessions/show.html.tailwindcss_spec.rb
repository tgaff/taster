require 'rails_helper'

RSpec.describe "taste_sessions/show", type: :view do
  before(:each) do
    assign(:taste_session, TasteSession.create!(
      name: "Name",
      detail: nil,
      link_name: "Link Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Link Name/)
  end
end
