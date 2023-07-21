# frozen_string_literal: true

module Tasting
  class SamplesController < BaseController
    before_action :set_tasting
    before_action :sample

    def show
      saved_flavor_ratings = FlavorRating.where(
        sample: sample,
        participant: participant
      )

      @flavor_ratings = Flavor.all.map do |flav|
        rating = saved_flavor_ratings.find { |saved| saved.flavor_id == flav.id }

        next rating if rating.present?

        FlavorRating.new(sample: sample, flavor: flav, participant: @participant)
      end
    end

    # def results
    #   @flavor_ratings = FlavorRating.where(sample_id: tasting.samples.ids, flavor_strength: 1..)
    #   participant_ids = @flavor_ratings.pluck(:participant_id)
    #   @participants = Participant.where(id: participant_ids).shuffle
    #   @flavors = @flavor_ratings.sort_by(&:flavor_strength).reverse.map(&:flavor).uniq
    # end
    def results
      @flavor_ratings = FlavorRating.where(sample_id: @sample.id, flavor_strength: 1..)
      participant_ids = @flavor_ratings.pluck(:participant_id)
      @participants = Participant.where(id: participant_ids).shuffle
      @flavors = @flavor_ratings.sort_by(&:flavor_strength).reverse.map(&:flavor).uniq
    end

    private

    def sample
      @sample ||= @taste_session.samples.find(params[:id])
    end
  end
end
