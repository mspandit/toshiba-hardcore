require 'spec_helper'

describe "items/index.html.erb" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :speed => 1,
        :price => 2,
        :memory => 3,
        :hard => 4,
        :optical => 5,
        :name => "Name",
        :description => "Description",
        :product_url => "Product Url",
        :image_url => "Image Url",
        :import_price => 1.5,
        :import_proc_type => "Import Proc Type",
        :import_proc_speed => "Import Proc Speed",
        :import_proc_number => "Import Proc Number",
        :import_memory => "Import Memory",
        :import_graphics => "Import Graphics",
        :import_hard => "Import Hard",
        :import_optical => "Import Optical"
      ),
      stub_model(Item,
        :speed => 1,
        :price => 2,
        :memory => 3,
        :hard => 4,
        :optical => 5,
        :name => "Name",
        :description => "Description",
        :product_url => "Product Url",
        :image_url => "Image Url",
        :import_price => 1.5,
        :import_proc_type => "Import Proc Type",
        :import_proc_speed => "Import Proc Speed",
        :import_proc_number => "Import Proc Number",
        :import_memory => "Import Memory",
        :import_graphics => "Import Graphics",
        :import_hard => "Import Hard",
        :import_optical => "Import Optical"
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Product Url".to_s, :count => 2

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Import Proc Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Import Proc Speed".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Import Proc Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Import Memory".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Import Graphics".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Import Hard".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Import Optical".to_s, :count => 2
  end
end
