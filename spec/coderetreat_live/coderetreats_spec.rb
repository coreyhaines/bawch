require 'coderetreats/presenters/collection'
require 'coderetreats'

describe CoderetreatLive::Coderetreats do
  describe ".running_today" do
    it "returns the collection wrapped in the presenter" do
      presenter = stub
      CoderetreatLive::Coderetreats::Presenters::Collection.stub(:for) { presenter }

      expect(CoderetreatLive::Coderetreats.running_today).to be(presenter)
    end
  end
end
