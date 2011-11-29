require 'spec_helper'

describe Item do
  it "should be able to find the maximum in a |-delimited string" do
    Item.maximum_in_string("B950|i3-2330M", Item::PROC_NUMBER_RANGE).should eq(7)
  end
end
