require 'rails_helper'

RSpec.describe '/create API endpoint', type: :request do
  context 'when sent valid input' do
    let(:payload) {
      { names: ['Alice','Bob','Charlie','Debbie'] }
    }

    it 'returns status 200 (success)' do
      response_status, response_body = create_request(request_payload: payload)
      expect(response_status).to eq(200)
    end

    it 'creates the appropriate number of records' do
      expect{create_request(request_payload: payload)}.to change{JunkRecord.count}.by(4)
    end

    it 'returns the number of created records' do
      response_status, response_body = create_request(request_payload: payload)
      expect(response_body[:num_created]).to eq(4)
    end
  end
end

def create_request(request_payload:)
  make_post_request(
    route: '/create',
    headers: { 'Content-Type' => 'application/json' },
    body: request_payload.to_json,
  )

  response_status = response.status
  response_body   = JSON.parse(response.body, symbolize_names: true)

  [response_status, response_body]
end

def make_post_request(route:, headers:, body: nil)
  post route, params: body, headers: headers
end

