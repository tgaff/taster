# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/taste_sessions", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # TasteSession. As you add validations to TasteSession, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'Vlad', detail: "my tasting" }
  end

  let(:invalid_attributes) do
    { name: nil, detail: nil }
  end

  describe "GET /index" do
    it "renders a successful response" do
      TasteSession.create! valid_attributes
      get taste_sessions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      taste_session = TasteSession.create! valid_attributes
      get taste_session_url(taste_session)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_taste_session_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      taste_session = TasteSession.create! valid_attributes
      get edit_taste_session_url(taste_session)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new TasteSession" do
        expect {
          post taste_sessions_url, params: { taste_session: valid_attributes }
        }.to change(TasteSession, :count).by(1)
      end

      it "redirects to the created taste_session" do
        post taste_sessions_url, params: { taste_session: valid_attributes }
        expect(response).to redirect_to(taste_session_url(TasteSession.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new TasteSession" do
        expect {
          post taste_sessions_url, params: { taste_session: invalid_attributes }
        }.not_to change(TasteSession, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post taste_sessions_url, params: { taste_session: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { name: 'Vlads Tasting', detail: "my special tasting" }
      end

      it "updates the requested taste_session" do
        taste_session = TasteSession.create! valid_attributes
        patch taste_session_url(taste_session), params: { taste_session: new_attributes }
        taste_session.reload
        expect(taste_session.name).to eq('Vlads Tasting')
      end

      it "redirects to the taste_session" do
        taste_session = TasteSession.create! valid_attributes
        patch taste_session_url(taste_session), params: { taste_session: new_attributes }
        taste_session.reload
        expect(response).to redirect_to(taste_session_url(taste_session))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        taste_session = TasteSession.create! valid_attributes
        patch taste_session_url(taste_session), params: { taste_session: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested taste_session" do
      taste_session = TasteSession.create! valid_attributes
      expect {
        delete taste_session_url(taste_session)
      }.to change(TasteSession, :count).by(-1)
    end

    it "redirects to the taste_sessions list" do
      taste_session = TasteSession.create! valid_attributes
      delete taste_session_url(taste_session)
      expect(response).to redirect_to(taste_sessions_url)
    end
  end
end
