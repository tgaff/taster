# frozen_string_literal: true

class TastingController < ApplicationController
  before_action :tasting

  def show
    info cookies.to_h
    cookies.permanent[:tasting_session_id] = tasting.id

    return if participant

    session[:redirect_path] = request.path
    redirect_to :new_participant_session
  end

  private

  def tasting
    @taste_session = TasteSession.find(params[:id])
  end

end
