require 'coderetreats'

class CoderetreatsController < ApplicationController
  def running_today
    @coderetreats = CoderetreatLive::Coderetreats.running_today
  end

  def edit_status
    @coderetreat = Coderetreat.find(params[:id])
  end
end
