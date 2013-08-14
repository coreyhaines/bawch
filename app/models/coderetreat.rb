class Coderetreat < ActiveRecord::Base
  attr_accessible :location, :status

  def self.running_today
    all
  end

  def available_next_statuses
    ["not_started", "on_break", "in_session"] - [self.status]
  end

  def update_status(new_status)
    self.update_attributes status: new_status
  end
end
