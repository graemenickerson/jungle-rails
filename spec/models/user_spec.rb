require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    subject { described_class.new(f_name: "Electric", l_name: "Chariot", email: "test@test.com", password: "12345", password_confirmation: "12345")}

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid when passwords do not match" do
      subject.password = '1234'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Password confirmation doesn't match Password", "Password confirmation doesn't match Password"])
    end

    it "is not valid when email is not unique" do 
      subject_two = User.new(f_name: "Test", l_name: "Ing", email: 'test@test.com', password: '123', password_confirmation: "123")
      subject_two.save
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Email has already been taken"])
    end
    
    it "is not vaild without email" do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Email can't be blank"])
    end

    it "is not valid without first name" do
      subject.f_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["F name can't be blank"])
    end 

    it "is not valid without last name" do
      subject.l_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["L name can't be blank"])
    end

    it "is not valid when password is shorter than 3 characters" do
      subject.password = "12"
      subject.password_confirmation = "12"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Password is too short (minimum is 3 characters)"])
    end

  end

  describe '.authenticate_with_credentials' do
    subject { described_class.new(f_name: "Electric", l_name: "Chariot", email: "test@test.com", password: "12345", password_confirmation: "12345")}

    it "is not valid if user does not exist" 
    it "does not allow login with wrong password"

  end

end
