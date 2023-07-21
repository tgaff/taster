# frozen_string_literal: true

class TastingController < ApplicationController
  before_action :tasting

  def show
    cookies.encrypted[:tasting_session_id] = tasting.id

    return if participant

    session[:redirect_path] = request.path
    redirect_to :new_participant_session
  end

  def results
    @flavor_ratings = FlavorRating.where(sample_id: tasting.samples.ids, flavor_strength: 1..)
    participant_ids = @flavor_ratings.pluck(:participant_id)
    @participants = Participant.where(id: participant_ids).shuffle
    @flavors = @flavor_ratings.sort_by(&:flavor_strength).reverse.map(&:flavor).uniq
  end

  private

  # TODO: this controller can move into Tasting and use the method on its Base class
  def tasting
    @taste_session ||= TasteSession.find(params[:id] || params[:tasting_id])
    @tasting = @taste_session # FIXME
  end

end
