require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "associatons" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  describe "#initialization" do
    let(:question) { FactoryGirl.create(:question) }
    it "returns a title string" do
      expect(question.title).to include("Tequila")
    end
    it "returns a description string" do
      expect(question.description).to eq("What is tequila?")
    end
    it "returns a user id" do
      expect(question.user_id.class).to be(Fixnum)
    end
  end
end
