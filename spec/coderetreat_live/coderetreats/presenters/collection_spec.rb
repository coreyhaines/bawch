require 'coderetreats/presenters/collection'

describe CoderetreatLive::Coderetreats::Presenters::Collection do
  context "getting the coderetreats grouped by status" do
    let(:in_session) { stub("in_session", status: "in_session") }
    let(:on_break) { stub("on_break", status: "on_break") }
    let(:not_started) { stub("not_started", status: "not_started") }
    let(:coderetreats) { [not_started, in_session, on_break] }
    let(:presenter) { CoderetreatLive::Coderetreats::Presenters::Collection.for(coderetreats) }

    it "exposes those in status not_started" do
      expect{|b| presenter.not_started(&b) }.to yield_successive_args(not_started)
    end

    it "exposes those in status in_session" do
      expect{|b| presenter.in_session(&b) }.to yield_successive_args(in_session)
    end

    it "exposes those in status on_break" do
      expect{|b| presenter.on_break(&b) }.to yield_successive_args(on_break)
    end
  end
end
