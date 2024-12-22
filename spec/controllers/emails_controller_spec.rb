require 'rails_helper'

RSpec.describe EmailsController, type: :controller do
  describe 'POST #parse' do
    let(:valid_email_path) { 'tmp/sample_email.eml' }
    let(:invalid_email_path) { 'tmp/non_existent.eml' }

    before do
      allow(EmailParserService).to receive(:parse).and_return({ "key" => "value" })
    end

    context 'when email_path is provided and valid' do
      it 'returns a successful JSON response' do
        post :parse, params: { email_path: valid_email_path }

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to eq({ "key" => "value" })
      end
    end

    context 'when email_path is not provided' do
      it 'returns a bad request error' do
        post :parse, params: { email_path: '' }

        expect(response).to have_http_status(:bad_request)
        expect(JSON.parse(response.body)).to eq({ "error" => "Email path is required" })
      end
    end

    context 'when EmailParserService raises an error' do
      before do
        allow(EmailParserService).to receive(:parse).and_raise(StandardError, "Failed to parse email")
      end

      it 'returns an unprocessable entity error' do
        post :parse, params: { email_path: invalid_email_path }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq({ "error" => "Failed to parse email" })
      end
    end
  end
end
