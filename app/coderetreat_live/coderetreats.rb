require 'coderetreats/presenters/collection'
Coderetreat = Struct.new :status, :location
module CoderetreatLive
  module Coderetreats
    def self.running_today
      coderetreats = [
        Coderetreat.new("not_started", "Chicago"),
        Coderetreat.new("not_started", "Seattle"),
        Coderetreat.new("in_session", "Berlin")
      ]
      Presenters::Collection.for(coderetreats)
    end
  end
end
