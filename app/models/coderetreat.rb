class Coderetreat < ActiveRecord::Base
  attr_accessible :location, :status

  def self.running_today
    []
  end
end
