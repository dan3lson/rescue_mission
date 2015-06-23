require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  let(:user) { User.new(first_name: "Jose", last_name: "Cuervo", email: "jose@cuervo.com") }

  describe "#full_name" do
    it "returns a full name string" do
      expect(full_name(user.first_name, user.last_name)).to eq("Jose Cuervo")
    end
  end
end
