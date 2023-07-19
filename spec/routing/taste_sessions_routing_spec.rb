# frozen_string_literal: true

require "rails_helper"

RSpec.describe TasteSessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/taste_sessions").to route_to("taste_sessions#index")
    end

    it "routes to #new" do
      expect(get: "/taste_sessions/new").to route_to("taste_sessions#new")
    end

    it "routes to #show" do
      expect(get: "/taste_sessions/1").to route_to("taste_sessions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/taste_sessions/1/edit").to route_to("taste_sessions#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/taste_sessions").to route_to("taste_sessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/taste_sessions/1").to route_to("taste_sessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/taste_sessions/1").to route_to("taste_sessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/taste_sessions/1").to route_to("taste_sessions#destroy", id: "1")
    end
  end
end
