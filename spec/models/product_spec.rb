require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    category = Category.create(name: "Electronics")
    subject { described_class.new(name: "Electric Chariot", price: 200, quantity: 300, category: category)}
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'is not valid without a category' do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Category can't be blank"])
    end

  end

end
