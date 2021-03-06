require 'coderetreats/presenters/collection'

describe CoderetreatLive::Coderetreats::Presenters::Collection do
  context "getting the coderetreats grouped by status" do
    let(:in_session) { stub("in_session", status: "in_session") }
    let(:on_break) { stub("on_break", status: "on_break") }
    let(:not_started) { stub("not_started", status: "not_started") }
    let(:coderetreats) { [not_started, in_session, on_break] }
    let(:presenter) { CoderetreatLive::Coderetreats::Presenters::Collection.for(coderetreats) }

    describe "#grouped_by_status" do
      it "yields the possible statuses for a coderetreat" do
        expected_statuses = ["in_session", "on_break", "not_started"]
        presenter =  CoderetreatLive::Coderetreats::Presenters::Collection.for([])
        presenter.grouped_by_status do |status, _|
          expected_statuses.delete status
        end
        expect(expected_statuses).to eq([])
      end

      it "yields the coderetreats associated to the statuses" do
        yielded_coderetreats = {}
        presenter.grouped_by_status do |status, coderetreats|
          yielded_coderetreats[status] = coderetreats
        end
        expect(yielded_coderetreats["in_session"]).to eq([in_session])
        expect(yielded_coderetreats["on_break"]).to eq([on_break])
        expect(yielded_coderetreats["not_started"]).to eq([not_started])
      end
    end
  end
end
