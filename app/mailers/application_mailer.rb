# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ::FROM_MAILER
  layout "mailer"
end
