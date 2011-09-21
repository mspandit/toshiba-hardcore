require 'spec_helper'

describe "items/edit.html.erb" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :speed => 1,
      :price => 1,
      :memory => 1,
      :hard => 1,
      :optical => 1,
      :name => "MyString",
      :description => "MyString",
      :product_url => "MyString",
      :image_url => "MyString",
      :import_price => 1.5,
      :import_proc_type => "MyString",
      :import_proc_speed => "MyString",
      :import_proc_number => "MyString",
      :import_memory => "MyString",
      :import_graphics => "MyString",
      :import_hard => "MyString",
      :import_optical => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path(@item), :method => "post" do
      assert_select "input#item_speed", :name => "item[speed]"
      assert_select "input#item_price", :name => "item[price]"
      assert_select "input#item_memory", :name => "item[memory]"
      assert_select "input#item_hard", :name => "item[hard]"
      assert_select "input#item_optical", :name => "item[optical]"
      assert_select "input#item_name", :name => "item[name]"
      assert_select "input#item_description", :name => "item[description]"
      assert_select "input#item_product_url", :name => "item[product_url]"
      assert_select "input#item_image_url", :name => "item[image_url]"
      assert_select "input#item_import_price", :name => "item[import_price]"
      assert_select "input#item_import_proc_type", :name => "item[import_proc_type]"
      assert_select "input#item_import_proc_speed", :name => "item[import_proc_speed]"
      assert_select "input#item_import_proc_number", :name => "item[import_proc_number]"
      assert_select "input#item_import_memory", :name => "item[import_memory]"
      assert_select "input#item_import_graphics", :name => "item[import_graphics]"
      assert_select "input#item_import_hard", :name => "item[import_hard]"
      assert_select "input#item_import_optical", :name => "item[import_optical]"
    end
  end
end
