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

        ["not_started", "in_session"].each do |status|
          define_method status do |&block|
            in_status(status, &block)
          end
        end

        def in_status(status, &block)
          self.coderetreats.select{|cr| cr.status == status}.each(&block)
        end
      end
    end
  end
end
