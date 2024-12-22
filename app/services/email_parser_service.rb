# app/services/email_parser_service.rb
require "mail"
require "json"
require "open-uri"

class EmailParserService
  def self.parse(email_path)
    mail = Mail.read(email_path)

    # Check for attachments
    json_attachment = mail.attachments.find { |a| a.mime_type == "application/json" }
    return JSON.parse(json_attachment.decoded) if json_attachment

    # Check for JSON URL in the body
    url = extract_url_from_body(mail.body.decoded)
    if url
      json_content = URI.open(url).read
      return JSON.parse(json_content)
    end

    raise "No valid JSON found in email."
  end

  private

  def self.extract_url_from_body(body)
    url_regex = %r{https?://[^\s]+}
    match = body.match(url_regex)
    match[0] if match
  end
end
