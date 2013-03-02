module CoderetreatLive
  module Coderetreats
    module Presenters
      class Collection
        def self.for(coderetreats)
          new(coderetreats)
        end

        attr_reader :coderetreats
        def initialize(coderetreats)
          @coderetreats = coderetreats
        end

        def not_started(&block)
          self.coderetreats.select{|cr| cr.status == "not_started"}.each(&block)
        end

        def in_session(&block)
          self.coderetreats.select{|cr| cr.status == "in_session"}.each(&block)
        end
      end
    end
  end
end
