module Tasting
  class FlavorRatingsController < BaseController
    before_action :set_tasting

    def update
    end

    private

    def sample
      @sample ||= @taste_session.samples.find(params[:sample_id])
    end

    def flavor
      Flavor.find(params[:flavor])
    end
  end
end
