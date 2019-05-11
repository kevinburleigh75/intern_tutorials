require 'rails_helper'

RSpec.describe '/create API endpoint', type: :request do
  let(:service_instance_double) {
    instance_double(CreateService).tap do |dbl|
      allow(dbl).to receive(:process).with(given_request_payload).and_return(target_response_payload)
    end
  }

  before(:each) do
    allow(CreateService).to receive(:new).and_return(service_instance_double)
  end

  context 'when sent valid input' do
    let(:given_request_payload) {
      { names: ['Alice','Bob','Charlie','Debbie', nested: {foo: 'bar'}] }
    }

    let(:target_response_payload) {
      { num_created: 4, nested: {foo: 'bar'} }
    }

    it 'the CreateService service is called with the given request payload' do
      response_status, response_body = create_request(request_payload: given_request_payload)
      expect(service_instance_double).to have_received(:process).with(given_request_payload)
    end

    it 'the result of the CreateService service call is returned in the response payload' do
      response_status, response_body = create_request(request_payload: given_request_payload)
      expect(response_body).to eq(target_response_payload)
    end

    it 'the response status is 200 (success)' do
      response_status, response_body = create_request(request_payload: given_request_payload)
      expect(response_status).to eq(200)
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

