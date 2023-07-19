# frozen_string_literal: true

require "rails_helper"

RSpec.describe SamplesController, type: :routing do
  describe "routing" do
    let!(:ts) { TasteSession.create(name: 'test1') }
    let(:prefix) { "/taste_sessions/#{ts.id}" }

    it "routes to #index" do
      expect(get: "#{prefix}/samples").to route_to("samples#index", taste_session_id: ts.id.to_s)
    end

    it "routes to #new" do
      expect(get: "#{prefix}/samples/new").to route_to("samples#new", taste_session_id: ts.id.to_s)
    end

    it "routes to #show" do
      expect(get: "#{prefix}/samples/1").to route_to("samples#show", id: "1", taste_session_id: ts.id.to_s)
    end

    it "routes to #edit" do
      expect(get: "#{prefix}/samples/1/edit").to route_to("samples#edit", id: "1", taste_session_id: ts.id.to_s)
    end

    it "routes to #create" do
      expect(post: "#{prefix}/samples").to route_to("samples#create", taste_session_id: ts.id.to_s)
    end

    it "routes to #update via PUT" do
      expect(put: "#{prefix}/samples/1").to route_to("samples#update", id: "1", taste_session_id: ts.id.to_s)
    end

    it "routes to #update via PATCH" do
      expect(patch: "#{prefix}/samples/1").to route_to("samples#update", id: "1", taste_session_id: ts.id.to_s)
    end

    it "routes to #destroy" do
      expect(delete: "#{prefix}/samples/1").to route_to("samples#destroy", id: "1", taste_session_id: ts.id.to_s)
    end
  end
end
