# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def participant
    return nil unless cookies.encrypted[:participant_id]

    Participant.find_by(id: cookies.encrypted[:participant_id])
  end

  def sign_in_participant(participant)
    cookies.encrypted[:participant_id] = participant.id
  end

  def info(arg)
    Rails.logger.info(arg)
  end
end
