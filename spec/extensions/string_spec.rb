require 'spec_helper'

describe String do
  it "should parenthesize a string" do
    "wait, what?".parenthesize.should eql "(wait, what?)"
  end
  
  context "questionable" do
    it "should be if a question mark is on end" do
      'a?'.questionable?.should be_true
      'a'.questionable?.should be_false
    end
    
    it "should in-line replace the string" do
      v = 'a'
      v.questionable!
      v.should eql 'a?'
    end
    
    it "should not add multiple question marks" do
      'a?'.questionable.should eql 'a?'
    end
  end
end
