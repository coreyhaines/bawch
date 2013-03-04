require 'active_record_spec_helper'
require 'coderetreat'

describe "Looking up coderetreats" do
  describe ".running_today" do
    context "when there are no coderetreats" do
      it "returns an empty list" do
        Coderetreat.destroy_all
        expect(Coderetreat.running_today).to be_empty
      end
    end

    it "returns all the coderetreats in the system" do
      in_session = Coderetreat.create! location: "Chicago", status: "in_session"
      not_started = Coderetreat.create! location: "Seattle", status: "not_started"
      expect(Coderetreat.running_today).to eq([in_session, not_started])
    end
  end
end
