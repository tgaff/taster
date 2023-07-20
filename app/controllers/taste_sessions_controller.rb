# frozen_string_literal: true

class TasteSessionsController < ApplicationController
  before_action :set_taste_session, only: %i[ show edit update destroy ]

  # GET /taste_sessions or /taste_sessions.json
  def index
    @taste_sessions = TasteSession.all
  end

  # GET /taste_sessions/1 or /taste_sessions/1.json
  def show
    @qr = qr_svg
  end

  # GET /taste_sessions/new
  def new
    @taste_session = TasteSession.new
  end

  # GET /taste_sessions/1/edit
  def edit
  end

  # POST /taste_sessions or /taste_sessions.json
  def create
    @taste_session = TasteSession.new(taste_session_params)

    respond_to do |format|
      if @taste_session.save
        format.html { redirect_to taste_session_url(@taste_session), notice: "Taste session was successfully created." }
        format.json { render :show, status: :created, location: @taste_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @taste_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taste_sessions/1 or /taste_sessions/1.json
  def update
    respond_to do |format|
      if @taste_session.update(taste_session_params)
        format.html { redirect_to taste_session_url(@taste_session), notice: "Taste session was successfully updated." }
        format.json { render :show, status: :ok, location: @taste_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @taste_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taste_sessions/1 or /taste_sessions/1.json
  def destroy
    @taste_session.destroy

    respond_to do |format|
      format.html { redirect_to taste_sessions_url, notice: "Taste session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def qr_svg
    qrcode = RQRCode::QRCode.new("https://kyan.com")
    qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_taste_session
    @taste_session = TasteSession.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def taste_session_params
    params.require(:taste_session).permit(:name, :detail, :link_name)
  end
end
