require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do

  subject(:dessert) do
    Dessert.new("cake",20, chef)
  end

  let(:chef) { double("chef", name: "Chen") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(20)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("brownnie","3","Zoe")}.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.add_ingredient("salt")).to eq(["salt"])
    end
  end

  describe "#mix!" do
    before(:each) do
      dessert.add_ingredient("peach")
      dessert.add_ingredient("salt")
      dessert.add_ingredient("avacado")
    end

    it "shuffles the ingredient array" do
      expect(dessert.mix! == dessert.ingredients).to be false
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(5)).to eq(15)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(25)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:title).and_return("")
    end
  end

  describe "#make_more" do
    before(:each) do
      dessert.make_more
    end
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(dessert.temp).to eq(400)
    end
  end
end
