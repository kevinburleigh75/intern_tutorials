require 'rails_helper'

RSpec.describe '/create API endpoint', type: :request do
  context 'when sent valid input' do
    it 'returns status 200 (success)' do
      payload = {
        names: [
          'Alice',
          'Bob',
          'Charlie',
          'Debbie',
        ]
      }
      response_status, response_body = create_request(request_payload: payload)
      expect(response_status).to eq(200)
    end

    it 'returns the number of created records' do
      payload = {
        names: [
          'Alice',
          'Bob',
          'Charlie',
          'Debbie',
        ]
      }
      response_status, response_body = create_request(request_payload: payload)
      expect(response_body.num_created).to eq(4)
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
  response_body   = JSON.parse(response.body)

  [response_status, response_body]
end

def make_post_request(route:, headers:, body: nil)
  post route, params: body, headers: headers
end

