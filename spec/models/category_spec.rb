require 'spec_helper'

describe Category do
  pending "add some examples to (or delete) #{__FILE__}"
  
  # Rspec syntax
  # it "doesn't valid without name" do
  #   #category = FactoryGirl.create(:category)
  #   expect(FactoryGirl.build(:category)).to validate_presence_of(:name)
  # end

  # Shoulda - matchers old syntax
  # it { should validate_presence_of(:name) }

  # Shoulda - matchers new expect syntax (rspec config alias)
  expect_it { to validate_presence_of :name }

  # it "doesnt't valid with non uniqueness name" do
  expect_it { to validate_uniqueness_of :name}
  
  # it "does have length more then 2" do
  expect_it { to ensure_length_of(:name).is_at_least(3)}

  # it "does have many items" do
  expect_it { to have_many :items }
end


