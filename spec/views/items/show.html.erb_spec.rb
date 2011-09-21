require 'spec_helper'

describe "items/show.html.erb" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :speed => 1,
      :price => 1,
      :memory => 1,
      :hard => 1,
      :optical => 1,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Product Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Import Proc Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Import Proc Speed/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Import Proc Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Import Memory/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Import Graphics/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Import Hard/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Import Optical/)
  end
end
