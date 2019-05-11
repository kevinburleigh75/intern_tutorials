require 'rails_helper'

RSpec.describe CreateService, :truncation do
  context 'when no names are given' do
    it 'no JunkRecords are created' do
      expect{CreateService.new.process({names: []})}.to_not change{JunkRecord.count}
    end
    it 'returns num_created == 0' do
      expect(CreateService.new.process({names: []})).to eq({num_created: 0})
    end
  end

  context 'when previously-unseen names are given' do
    it 'creates one JunkRecord for each given name' do
      expect{CreateService.new.process({names: ['Alice', 'Bob']})}.to change{JunkRecord.count}.by(2)
    end
    it 'sets num_created equal to the number of created JunkRecords' do
      expect(CreateService.new.process({names: ['Alice', 'Bob']})).to eq({num_created: 2})
    end
  end

  context 'when previously-seen names are given' do
    let!(:previously_seen_records) {
      [
        create(:junk_record, name: 'Alice'),
        create(:junk_record, name: 'Bob')
      ]
    }

    it 'does not create JunkRecords' do
      expect{CreateService.new.process({names: ['Alice', 'Bob']})}.to change{JunkRecord.count}.by(0)
    end
    it 'returns num_created == 0' do
      expect(CreateService.new.process({names: ['Alice', 'Bob']})).to eq({num_created: 0})
    end
  end
end
