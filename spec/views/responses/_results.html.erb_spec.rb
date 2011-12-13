require 'spec_helper'

describe "responses/_results.html.erb" do
  before(:each) do
    @hardcore = assign(:response, stub_model(Item,
      name: "An even cooler laptop",
      import_proc_type: "i5",
      import_price: "1500.00",
      import_sale_price: "1400.00",
      product_url: "http://one"
    ))
    @recommended = assign(:response, stub_model(Item,
      name: "A cool laptop",
      import_proc_type: "i7",
      import_price: "1399.99",
      import_sale_price: "1099.99",
      product_url: "http://two"
    ))
  end

  it "renders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/onclick/)
    rendered.should match(/Recommended Result/)
    rendered.should match(/Hardcore Result/)
    rendered.should match(/http:\/\/one/)
    rendered.should match(/http:\/\/two/)
  end
end
