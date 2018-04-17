RSpec.describe String do
  let(:string) { ('a'..'z').to_a.join() }

  describe '#exclude?' do
    context 'when the parameter is single char string' do
      context 'when the given parameter is found in string' do
        it 'returns false' do
          expect(string.exclude?('a')).to eql(false)
        end
      end

      context 'when the given parameter is not found in string' do
        it 'returns true' do
          expect(string.exclude?('1')).to eql(true)
        end
      end
    end

    context 'when the parameter length is more than 1 char' do
      context 'when the given parameter is found in string' do
        it 'returns false' do
          expect(string.exclude?('bcd')).to eql(false)
        end
      end

      context 'when the given parameter is not found in string' do
        it 'returns true' do
          expect(string.exclude?('bca')).to eql(true)
        end
      end
    end
  end
end
