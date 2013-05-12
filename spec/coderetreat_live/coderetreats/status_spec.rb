require 'coderetreats/status'

describe CoderetreatLive::Coderetreats::Status do
  describe ".update_to" do
    it "tells the coderetreat to update its status" do
      coderetreat = stub
      stub_const("::Coderetreat", stub(find: coderetreat))
      coderetreat.should_receive(:update_status).with("in_session")

      CoderetreatLive::Coderetreats::Status.update_to("5", "in_session")
    end
  end
end
