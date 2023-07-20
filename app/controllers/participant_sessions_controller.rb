# frozen_string_literal: true

class ParticipantSessionsController < ApplicationController
  def new
    @participant = Participant.new
  end

  def create
    participant = Participant.create(participant_params)
    sign_in_participant(participant)

    if (back_where_they_came_from = session[:redirect_path])
      session[:redirect_path] = nil

      return redirect_to back_where_they_came_from
    end

    redirect_to root_path # do something about this later
  end

  def delete
    cookies.encrypted[:participant_id] = nil

    redirect_to action: :new
  end

  private

  def participant_params
    params.require(:participant).permit(:name)
  end
end
