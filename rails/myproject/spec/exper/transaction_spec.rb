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

RSpec.describe 'transaction oddities' do
  context 'rolling back a nested transaction' do
    it 'probably does not do what you were expecting' do
      JunkRecord.transaction do
        JunkRecord.create!(name: 'foo')
        JunkRecord.transaction do
          JunkRecord.create!(name: 'bar')
          raise ActiveRecord::Rollback
        end
      end

      expect(JunkRecord.count).to eq(2)
    end
  end

  context 'rolling back a nested transaction with requires_new set' do
    it 'behaves as expected' do
      JunkRecord.transaction do
        JunkRecord.create!(name: 'foo')
        JunkRecord.transaction(requires_new: true) do
          JunkRecord.create!(name: 'bar')
          raise ActiveRecord::Rollback
        end
      end

      expect(JunkRecord.count).to eq(1)
    end
  end
end

RSpec.describe 'example transaction detection' do
  it 'is inside a transaction' do
    expect(ActiveRecord::Base.connection.open_transactions).to_not eq(0)
  end
end
