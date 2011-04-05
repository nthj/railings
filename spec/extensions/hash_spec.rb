require 'spec_helper'

describe Hash do
  it "should filter each value" do
    { :key => 'value' }.filter(&:questionable).should eql({ :key => 'value?' })
  end
end
