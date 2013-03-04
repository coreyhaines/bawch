require 'coderetreats/presenters/collection'

module CoderetreatLive
  module Coderetreats
    def self.running_today
      Presenters::Collection.for(::Coderetreat.running_today)
    end
  end
end
