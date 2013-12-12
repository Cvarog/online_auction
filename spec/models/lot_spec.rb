require 'spec_helper'

describe Lot do
  pending "add some examples to (or delete) #{__FILE__}"

  it "does invalid with blank name" do
    expect(FactoryGirl.build(:lot, name: nil)).to be_invalid
  end

  it "doesn't allow description to be less then 30 chars" do
    expect(FactoryGirl.build(:lot, description: "Description of someth")).to be_invalid
  end


end