require 'rails_helper'

RSpec.describe 'transactions' do
  context 'basic database cleanup' do
    it 'initially has zero records' do
      expect(JunkRecord.count).to eq(0)
    end

    it 'can create records' do
      JunkRecord.create!(name: 'foo')
      expect(JunkRecord.count).to eq(1)
    end

    it 'resets the records for the next test' do
      expect(JunkRecord.count).to eq(0)
    end
  end
end
