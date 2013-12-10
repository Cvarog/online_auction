require 'spec_helper'

describe Category do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is't valid without name" do
    #category = FactoryGirl.create(:category)
    expect(FactoryGirl.create(:category)).to validate_presence_of(:name)
  end
end


