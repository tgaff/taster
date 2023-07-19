# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "taste_sessions/new", type: :view do
  before(:each) do
    assign(:taste_session, TasteSession.new(
      name: "MyString",
      detail: nil,
      link_name: "MyString"
    ))
  end

  it "renders new taste_session form" do
    render

    assert_select "form[action=?][method=?]", taste_sessions_path, "post" do
      assert_select "input[name=?]", "taste_session[name]"

      assert_select "input[name=?]", "taste_session[detail]"

      assert_select "input[name=?]", "taste_session[link_name]"
    end
  end
end
