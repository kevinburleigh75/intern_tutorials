class JunkRecordsController < ApplicationController
  def create
    params['names'].each do |name|
      JunkRecord.create!(name: name)
    end
    render json: {num_created: params['names'].size}, status: 200
  end
end
