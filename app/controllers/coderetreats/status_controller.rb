require 'coderetreats/status'
module Coderetreats
  class StatusController < ApplicationController
    def edit
      @coderetreat = Coderetreat.find(coderetreat_id)
    end

    def update
      CoderetreatLive::Coderetreats::Status.update_to(coderetreat_id, params[:new_status])
      redirect_to edit_coderetreat_status_url(coderetreat_id)
    end
  private
    def coderetreat_id
      params[:coderetreat_id]
    end
  end
end
