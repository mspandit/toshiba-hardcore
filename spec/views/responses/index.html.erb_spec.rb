require 'spec_helper'

describe "responses/index.html.erb" do
  before(:each) do
    assign(:responses, [
      stub_model(Response,
        :online => 1,
        :watch => 2,
        :edit_movies => 3,
        :download => 4,
        :print => 5,
        :edit_photos => 6,
        :stream => 7,
        :digital => 8,
        :record => 9,
        :scrabble => 10,
        :rpg => 11,
        :shooters => 12
      ),
      stub_model(Response,
        :online => 1,
        :watch => 2,
        :edit_movies => 3,
        :download => 4,
        :print => 5,
        :edit_photos => 6,
        :stream => 7,
        :digital => 8,
        :record => 9,
        :scrabble => 10,
        :rpg => 11,
        :shooters => 12
      )
    ])
  end

  it "renders a list of responses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 2.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 3.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 4.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 6.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 7.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 8.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 9.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 10.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 11.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 12.to_s, :count => 2
  end
end
