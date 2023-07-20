# frozen_string_literal: true

module Tasting
  class SamplesController < BaseController
    before_action :set_tasting

    def show
      @sample = @taste_session.samples.find(params[:id])

      saved_flavor_ratings = FlavorRating.where(
        sample: @sample,
        participant: @participant
      )

      @flavor_ratings = Flavor.all.map do |flav|
        rating = saved_flavor_ratings.find { |saved| saved.flavor_id == flav.id }

        next rating if rating.present?

        FlavorRating.new(sample: @sample, flavor: flav, participant: @participant)
      end
    end
  end
end