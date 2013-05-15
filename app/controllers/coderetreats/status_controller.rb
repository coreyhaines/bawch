module Coderetreats
  class StatusController < ApplicationController
    def edit
      @coderetreat = Coderetreat.find(coderetreat_id)
    end
  private
    def coderetreat_id
      params[:coderetreat_id]
    end
  end
end
