require 'spec_helper'

describe Category do
  pending "add some examples to (or delete) #{__FILE__}"

  it "isn't valid without name" do
    #category = FactoryGirl.create(:category)
    expect(FactoryGirl.build(:category)).to validate_presence_of(:name)
  end

  it "isn't valid with non uniqueness name" do
    expect(FactoryGirl.build(:category)).to validate_uniqueness_of(:name)
  end

  it "is have length more then 2" do
    expect(Category.new(name:"IO")).to_not be_valid
  end

  it "is have many items" do
    expect(FactoryGirl.build(:category)).to have_many(:items)
  end
end


