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
end
