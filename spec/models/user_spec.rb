require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  describe "#initialization" do
    it "returns a first_name string" do
      expect(user.first_name).to eq("Jose")
    end
    it "returns a last_name string" do
      expect(user.last_name).to eq("Cuervo")
    end
    it "returns an email string" do
      expect(user.email).to eq("jose@cuervo.com")
    end
  end
end
