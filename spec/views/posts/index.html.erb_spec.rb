require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :activity => "MyText",
        :location => "MyText",
        :time => "MyText",
        :day => "MyText"
      ),
      Post.create!(
        :activity => "MyText",
        :location => "MyText",
        :time => "MyText",
        :day => "MyText"
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 8
    assert_select "tr>td", :text => "MyText".to_s, :count => 8
    assert_select "tr>td", :text => "MyText".to_s, :count => 8
    assert_select "tr>td", :text => "MyText".to_s, :count => 8
  end
end
