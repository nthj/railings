require 'spec_helper'

describe Class do
  it "should define each method" do
    class Object
      def_each(:a, :b) { |letter| letter }
    end
    
    Object.new.a.should == :a
    Object.new.b.should == :b
  end
end
