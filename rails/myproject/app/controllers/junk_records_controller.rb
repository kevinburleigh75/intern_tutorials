class JunkRecordsController < ApplicationController
  def create
    render json: {num_created: 4}, status: 200
  end
end
