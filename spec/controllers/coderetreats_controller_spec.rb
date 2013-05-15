require 'spec_helper'

describe CoderetreatsController do
  describe "GET /running_today" do
    it "gets the coderetreats running today" do
      coderetreats_presenter = stub

      CoderetreatLive::Coderetreats.stub(:running_today) { coderetreats_presenter }

      get :running_today
      expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    end
  end

  describe "PUT /update_status" do
    before do
      CoderetreatLive::Coderetreats::Status.stub(:update_to)
    end

    it "redirects back to the edit status page" do
      put :update_status, id: "5", new_status: "in_session"
      expect(response).to redirect_to(edit_coderetreat_status_url("5"))
    end

    it "updates the status of the coderetreat" do
      CoderetreatLive::Coderetreats::Status.should_receive(:update_to).with("5", "in_session")

      put :update_status, id: "5", new_status: "in_session"
    end
  end
end
