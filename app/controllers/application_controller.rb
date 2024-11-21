# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Exceptionable
  include Paginatable

  def route_not_found
    render(json: {
             message: I18n.t('controllers.route.not_found'),
             errorObj: [],
             statusCode: ::RESPONSE_STATUS_CODES[:not_found]
           }, status: :not_found)
  end
end
