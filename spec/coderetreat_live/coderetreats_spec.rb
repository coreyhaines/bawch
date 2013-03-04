require 'coderetreats/presenters/collection'
require 'coderetreats'

describe CoderetreatLive::Coderetreats do
  describe ".running_today" do
    it "wraps the coderetreats running today in a presenter" do
      running_today = stub "coderetreats"
      stub_const("::Coderetreat", stub(running_today: running_today))

      presenter = stub
      CoderetreatLive::Coderetreats::Presenters::Collection.stub(:for).with(running_today) { presenter }

      expect(CoderetreatLive::Coderetreats.running_today).to be(presenter)
    end
  end
end
