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
end
