require 'rails_helper'

RSpec.describe "taste_sessions/index", type: :view do
  before(:each) do
    assign(:taste_sessions, [
      TasteSession.create!(
        name: "Corker",
        detail: "some whiskey testing"
      ),
      TasteSession.create!(
        name: "Corker",
        detail: "blueberry"
      )
    ])
  end

  it "renders a list of taste_sessions" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select '.trix-content', text: Regexp.new("some whiskey testing".to_s), count: 1
    assert_select cell_selector, text: /Corker_?\d?/, count: 2
  end
end
