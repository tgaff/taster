# frozen_string_literal: true

class SamplesController < ApplicationController
  before_action :set_session
  before_action :set_sample, only: %i[ show edit update destroy ]

  # GET /samples or /samples.json
  def index
    @samples = @ts.samples.all
  end

  # GET /samples/1 or /samples/1.json
  def show
  end

  # GET /samples/new
  def new
    @sample = @ts.samples.new
  end

  # GET /samples/1/edit
  def edit
  end

  # POST /samples or /samples.json
  def create
    @sample = @ts.samples.new(sample_params)

    respond_to do |format|
      if @sample.save
        format.html { redirect_to taste_session_sample_url(@ts, @sample), notice: "Sample was successfully created." }
        format.json { render :show, status: :created, location: @sample }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /samples/1 or /samples/1.json
  def update
    respond_to do |format|
      if @sample.update(sample_params)
        format.html { redirect_to [@ts, @sample], notice: "Sample was successfully updated." }
        format.json { render :show, status: :ok, location: @sample }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samples/1 or /samples/1.json
  def destroy
    @sample.destroy

    respond_to do |format|
      format.html { redirect_to taste_session_samples_url(@ts), notice: "Sample was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_session
    @ts = TasteSession.find(params[:taste_session_id])
  end

  def set_sample
    @sample = @ts.samples.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sample_params
    params.require(:sample).permit(:taste_session_id, :name, :reveal_name)
  end
end
