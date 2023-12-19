# frozen_string_literal: true

# Responsible for defining common features and methods for mailers within the application
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
