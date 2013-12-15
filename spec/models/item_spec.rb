require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"

  # it "does invalid with blank name" do
  expect_it { to validate_presence_of :name }

  # it "does invalid with blank description" do
  expect_it { to validate_presence_of :description }
  
  # it "does invalid with blank price" do
  expect_it { to validate_presence_of :price }

  # it "doesn't allow name less then 3 chars" do
  expect_it { to ensure_length_of(:name).is_at_least(3) }
  
  # it "doesn't allow description less then 30 chars" do
  expect_it { to ensure_length_of(:description).is_at_least(60) }

  # it "doesn't allow non-numerical and negative price" do
  expect_it { to validate_numericality_of(:price).is_greater_than_or_equal_to(1) }

  # it "belongs to many category" do
  expect_it { to belong_to :category }

  # it "has many lots" do
  expect_it { to have_many :lots }
end
