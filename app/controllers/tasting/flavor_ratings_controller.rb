# frozen_string_literal: true

module Tasting
  class FlavorRatingsController < BaseController
    before_action :set_tasting

    def update
      flr = FlavorRating.find_or_initialize_by(participant: participant, sample: sample, flavor: flavor)
      flr.flavor_strength += crement
      flr.save
      @flavor_rating = flr
    end

    private

    def sample
      @sample ||= @taste_session.samples.find(params[:sample_id])
    end

    def flavor
      @flavor ||= Flavor.find(params[:flavor_id])
    end

    def crement
      params[:crement].to_i
    end
  end
end
