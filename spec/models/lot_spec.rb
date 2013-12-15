require 'spec_helper'

describe Lot do
  pending "add some examples to (or delete) #{__FILE__}"

  # it "does invalid with blank name" do
  expect_it { to validate_presence_of :name }

   # it "does invalid with blank description" do
  expect_it { to validate_presence_of :description }

  # it "does invalid with blank price" do
  expect_it { to validate_presence_of :price }

  # it "does invalid with blank bet_step" do
  expect_it { to validate_presence_of :price }

  # it "does invalid with blank end_time" do
  expect_it { to validate_presence_of :price }

  # it "doesn't allow description to be less then 30 chars" do
  expect_it { to ensure_length_of(:description).is_at_least(30) }

  # it "doesn't allow non-numerical and negative price" do
  expect_it { to validate_numericality_of(:price).is_greater_than_or_equal_to(1) }

  # it "doesn't allow non-numerical and negative bet_step" do
  expect_it { to validate_numericality_of(:price).is_greater_than_or_equal_to(0.25) }

end