module CoderetreatLive
  module Coderetreats
    class Status
      def self.update_to(coderetreat_id, new_status)
        ::Coderetreat.find(coderetreat_id).update_status new_status
      end
    end
  end
end
