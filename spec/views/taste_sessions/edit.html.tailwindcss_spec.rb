# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "taste_sessions/edit", type: :view do
  let(:taste_session) do
    TasteSession.create!(
      name: "MyString",
      detail: nil,
      link_name: "MyString"
    )
  end

  before(:each) do
    assign(:taste_session, taste_session)
  end

  it "renders the edit taste_session form" do
    render

    assert_select "form[action=?][method=?]", taste_session_path(taste_session), "post" do
      assert_select "input[name=?]", "taste_session[name]"

      assert_select "input[name=?]", "taste_session[detail]"

      assert_select "input[name=?]", "taste_session[link_name]"
    end
  end
end
