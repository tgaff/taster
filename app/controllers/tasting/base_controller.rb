# frozen_string_literal: true

module Tasting
  class BaseController < ApplicationController
    private

    def set_tasting
      id = cookies.encrypted[:tasting_session_id]
      @taste_session = TasteSession.find(id)
    end

  end
end
