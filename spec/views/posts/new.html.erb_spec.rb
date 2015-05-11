require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :activity => "MyText",
      :location => "MyText",
      :time => "MyText",
      :day => "MyText"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "textarea#post_activity[name=?]", "post[activity]"

      assert_select "textarea#post_location[name=?]", "post[location]"

      assert_select "textarea#post_time[name=?]", "post[time]"

      assert_select "textarea#post_day[name=?]", "post[day]"
    end
  end
end
