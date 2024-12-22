class EmailsController < ApplicationController
  def parse
    email_path = params[:email_path]

    if email_path.blank?
      render json: { error: "Email path is required" }, status: :bad_request
      return
    end

    begin
      json_content = EmailParserService.parse(email_path)
      render json: json_content
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
