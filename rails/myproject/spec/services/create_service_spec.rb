require 'rails_helper'

RSpec.describe CreateService do
  context 'when no names are given' do
    it 'no JunkRecords are created' do
      expect{CreateService.new.process({names: []})}.to_not change{JunkRecord.count}
    end
    it 'returns num_created == 0' do
      expect(CreateService.new.process({names: []})).to eq({num_created: 0})
    end
  end
end
