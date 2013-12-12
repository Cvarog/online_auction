require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"


  # it "does valid with name" do
  # 	expect(FactoryGirl.build(:item)).to validate_presence_of(:name)
  # end

  # it "doesn't valid with blank name" do
  # 	expect(Item.new(name:"")).to validate_presence_of(:name)
  # end

  it "does invalid with blank name" do
    expect(FactoryGirl.build(:item, name: nil)).to be_invalid
  end

  it "doesn't allow more then 3 chars" do
    expect(FactoryGirl.build(:item, name: "Ab")).to be_invalid
  end

  it "doesn't allow less then 30 chars" do
    expect(FactoryGirl.build(:item, description: "Description of something strange")).to be_invalid
  end

  it "doesn't allow non-numerical price" do
    expect(FactoryGirl.build(:item, price: 'one thousand')).to be_invalid
  end

  it "doesn't allow numbers less then 0" do
    expect(FactoryGirl.build(:item, price: -50)).to be_invalid
  end

  it "belongs to many category" do
    expect(FactoryGirl.build(:item)).to belong_to(:category)
  end

  it "has many lots" do
    expect(FactoryGirl.build(:item)).to have_many(:lots)
  end

end
