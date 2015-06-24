require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  describe "associatons" do
    it { should have_many(:questions) }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    subject { User.new(first_name: "John", last_name: "Doe") }
    it { should validate_uniqueness_of(:email) }
  end

  describe "#initialization" do
    it "returns a first_name string" do
      expect(user.first_name).to include("First Name")
    end
    it "returns a last_name string" do
      expect(user.last_name).to include("Last Name")
    end
    it "returns an email string" do
      expect(user.email).to include("@")
    end
  end
end
