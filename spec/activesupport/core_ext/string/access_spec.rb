RSpec.describe String do
  describe '#from' do
    context 'when the from parameter is bigger than the length of the string' do
      it 'returns nil' do
        string = 'foo'

        expect(string.from(4)).to eql(nil)
      end
    end

    context 'when the from parameter is less than the length of the string' do
      it 'returns the subset of the string by respecting the given from parameter' do
        string = 'foo'

        expect(string.from(1)).to eql('oo')
      end
    end
  end

  describe '#to' do
    context 'when the to parameter is bigger than the length of the string' do
      it 'returns whole string' do
        string = 'foo'

        expect(string.to(4)).to eql('foo')
      end
    end

    context 'when the to parameter is less than the length of the string' do
      it 'returns the subset of the string by respecting the given to parameter' do
        string = 'foo'

        expect(string.to(1)).to eql('fo')
      end
    end
  end

  describe '#first' do
    context 'when there is no parameter given' do
      it 'returns the first char of the string' do
        string = 'foo'

        expect(string.first).to eql('f')
      end
    end

    context 'when there is a length parameter given' do
      context 'when the given parameter is bigger than the length of the string' do
        it 'returns the entire string' do
          string = 'foo'

          expect(string.first(4)).to eql('foo')
        end
      end

      context 'when the given parameter is less than the length of the string' do
        it 'returns the subset of the string by respecting the given length parameter' do
          string = 'foo'

          expect(string.first(2)).to eql('fo')
        end
      end
    end
  end

  describe '#last' do
    context 'when there is no parameter given' do
      it 'returns the last char of the string' do
        string = 'foo?'

        expect(string.last).to eql('?')
      end
    end

    context 'when there is a length parameter given' do
      context 'when the given parameter is bigger than the length of the string' do
        it 'returns the entire string' do
          string = 'foo'

          expect(string.last(4)).to eql('foo')
        end
      end

      context 'when the given parameter is less than the length of the string' do
        it 'returns the subset of the string by respecting the given length parameter' do
          string = 'foo'

          expect(string.last(2)).to eql('oo')
        end
      end
    end
  end
end
