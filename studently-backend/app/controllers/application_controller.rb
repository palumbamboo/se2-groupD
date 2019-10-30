class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to do |format|
    format.json
  end
end
