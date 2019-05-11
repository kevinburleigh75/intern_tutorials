class JunkRecordsController < ApplicationController
  def create
    response_payload = CreateService.new.process(request.request_parameters.deep_symbolize_keys)
    render json: response_payload, status: 200
  end
end
