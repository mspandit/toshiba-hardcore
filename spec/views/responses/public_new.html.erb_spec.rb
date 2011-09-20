require 'spec_helper'

describe "responses/public_new.html.erb" do
  before(:each) do
    assign(:response, stub_model(Response,
      :online => 1,
      :watch => 1,
      :edit_movies => 1,
      :download => 1,
      :print => 1,
      :edit_photos => 1,
      :stream => 1,
      :digital => 1,
      :record => 1,
      :scrabble => 1,
      :rpg => 1,
      :shooters => 1
    ).as_new_record)
  end

  it "renders new response form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => responses_path, :method => "post" do
      assert_select "input#response_online", :name => "response[online]"
      assert_select "input#response_watch", :name => "response[watch]"
      assert_select "input#response_edit_movies", :name => "response[edit_movies]"
      assert_select "input#response_download", :name => "response[download]"
      assert_select "input#response_print", :name => "response[print]"
      assert_select "input#response_edit_photos", :name => "response[edit_photos]"
      assert_select "input#response_stream", :name => "response[stream]"
      assert_select "input#response_digital", :name => "response[digital]"
      assert_select "input#response_record", :name => "response[record]"
      assert_select "input#response_scrabble", :name => "response[scrabble]"
      assert_select "input#response_rpg", :name => "response[rpg]"
      assert_select "input#response_shooters", :name => "response[shooters]"
    end
  end
end
