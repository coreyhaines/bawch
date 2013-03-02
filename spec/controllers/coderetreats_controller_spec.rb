require 'spec_helper'

describe CoderetreatsController do
  describe "GET /running_today" do
    it "uses a coderetreats collection presenter" do
      coderetreats_presenter = stub

      stub_const("CoderetreatLive::Coderetreats::Presenters::Collection", stub(for: coderetreats_presenter))

      get :running_today
      expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    end
  end
end
