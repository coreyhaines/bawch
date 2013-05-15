require 'coderetreats'
require 'coderetreats/status'

class CoderetreatsController < ApplicationController
  def running_today
    @coderetreats = CoderetreatLive::Coderetreats.running_today
  end

  def update_status
    CoderetreatLive::Coderetreats::Status.update_to(coderetreat_id, params[:new_status])
    redirect_to edit_coderetreat_status_url(coderetreat_id)
  end

private
  def coderetreat_id
    params[:id]
  end
end
