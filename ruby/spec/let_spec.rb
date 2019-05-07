RSpec.describe 'let and let!' do
  context 'memoization' do
    let(:x) { puts 'this was called' }

    it 'let only evaluates the block once' do
      x
      x
    end
  end

  context 'conflicting let!s' do
    let!(:message) { puts 'outer' }

    context 'some nested context' do
      let!(:message) { puts 'inner' }

      it 'the innermost let! wins' do
      end
    end
  end
end
