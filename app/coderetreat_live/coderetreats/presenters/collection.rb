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

        def self.all_statuses
          ["not_started", "in_session", "on_break"]
        end

        def filtered_by_status(status)
          self.coderetreats.select{|cr| cr.status == status}
        end

        def grouped_by_status(&block)
          self.class.all_statuses.each do |status|
            yield status, filtered_by_status(status)
          end
        end

        self.all_statuses.each do |status|
          define_method status do |&block|
            in_status(status, &block)
          end
        end

        def in_status(status, &block)
          filtered_by_status(status).each(&block)
        end
      end
    end
  end
end
