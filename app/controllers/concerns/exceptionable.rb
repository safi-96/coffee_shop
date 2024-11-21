# frozen_string_literal: true

module Exceptionable
  extend ActiveSupport::Concern

  # Custom error classes
  class InvalidAccess < StandardError; end
  class InvalidAttribute < StandardError; end

  included do
    rescue_from Exception, with: :internal_server_error
    rescue_from ActiveRecord::RecordInvalid, with: :bad_request
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from InvalidAttribute, with: :bad_request
    rescue_from ActionController::ParameterMissing, with: :bad_request
    rescue_from ArgumentError, with: :bad_request
  end

  private

  # JSON response with message; Status code 500 - Internal server error
  def internal_server_error(error)
    message = error.message || 'Internal Server Error'
    backtrace = Rails.env.production? ? nil : error.backtrace
    render_error(message, :internal_server_error, backtrace: backtrace)
  end

  # JSON response with message; Status code 404 - Not Found
  def not_found(error)
    message = error&.model.present? ? "#{error.model} #{I18n.t('model.errors.not_found')}" : error
    render_error(message, :not_found)
  end

  # JSON response with message; Status code 400 - Bad Request
  def bad_request(error)
    render_error(errors_to_string(error), :bad_request, errors_to_object(error))
  end

  # JSON response renderer
  def render_error(message, status, error_obj = {})
    render(json: { message: message, status_code: RESPONSE_STATUS_CODES[status], error_obj: error_obj }, status: status)
  end

  def errors_to_string(error)
    return error.message unless error.respond_to?(:record)

    error.record.errors.full_messages.join(', ')
  end

  def errors_to_object(error)
    return {} unless error.respond_to?(:record)

    error.record.errors.messages.each_with_object({}) do |(key, messages), transformed_errors|
      transformed_errors[key.to_s] = messages.map { |message| "#{key.to_s.humanize} #{message}" }.join(', ')
    end
  end
end
