class ApplicationController < ActionController::API
  include ExceptionHandler
  include Paginator
end
