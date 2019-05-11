require 'rails_helper'

RSpec.describe CreateService, :truncation do
  context 'when no names are given' do
    it 'no JunkRecords are created' do
      expect{CreateService.new.process({names: []})}.to_not change{JunkRecord.count}
    end
    it 'num_created == 0' do
      expect(CreateService.new.process({names: []})).to eq({num_created: 0})
    end
  end

  context 'when names are given' do
    let(:all_names)               { ['Alice', 'Bob', 'Cindy', 'Daniel', 'Esther', 'Fred'] }
    let(:previously_seen_names)   { all_names.values_at(1,2,5) }
    let(:previously_unseen_names) { all_names - previously_seen_names }

    let!(:old_previously_seen_records) {
      previously_seen_names.map do |name|
        create(:junk_record, name: name)
      end
    }

    let(:payload) { { names: all_names } }

    it 'one JunkRecord per previously-unseen name is created' do
      expect{CreateService.new.process(payload)}.to change{JunkRecord.count}.by(previously_unseen_names.count)
    end
    it 'JunkRecords for previously-seen names are unchanged' do
      CreateService.new.process(payload)
      new_previously_seen_records = JunkRecord.where(name: previously_seen_names).order(:name)
      expect(new_previously_seen_records).to match_array(old_previously_seen_records)
    end
    it 'num_created is set to the number of created JunkRecords' do
      expect(CreateService.new.process(payload)).to eq({num_created: previously_unseen_names.count})
    end
  end
end
