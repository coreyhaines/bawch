require 'spec_helper'

describe Coderetreats::StatusController do
  describe "GET /edit" do
    it "assigns the coderetreat" do
      coderetreat = stub
      ::Coderetreat.stub(:find).with("5") { coderetreat}

      get :edit, coderetreat_id: "5"
      expect(assigns(:coderetreat)).to be(coderetreat)
    end
  end

  describe "PUT /update" do
    before do
      CoderetreatLive::Coderetreats::Status.stub(:update_to)
    end

    it "redirects back to the edit status page" do
      put :update, coderetreat_id: "5", new_status: "in_session"
      expect(response).to redirect_to(edit_coderetreat_status_url("5"))
    end

    it "updates the status of the coderetreat" do
      CoderetreatLive::Coderetreats::Status.should_receive(:update_to).with("5", "in_session")

      put :update, coderetreat_id: "5", new_status: "in_session"
    end
  end
end
