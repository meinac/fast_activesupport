RSpec.describe ActiveSupport::SecurityUtils do
  describe '::fixed_length_secure_compare' do
    context 'when the given strings are equal' do
      context 'when the given strings have different length' do
        it 'raises ArgumentError' do
          expect {
            ActiveSupport::SecurityUtils.fixed_length_secure_compare("foo", "foobar")
          }.to raise_error(ArgumentError)
        end
      end

      context 'when the given strings have same length' do
        it 'returns true' do
          expect(ActiveSupport::SecurityUtils.fixed_length_secure_compare("foo", "foo")).to eql(true)
        end
      end
    end

    context 'when the given strings are not equal' do
      it 'returns false' do
        expect(ActiveSupport::SecurityUtils.fixed_length_secure_compare("foo", "bar")).to eql(false)
      end
    end
  end

  describe '::secure_compare' do
    context 'when the given strings are equal' do
      it 'returns true' do
        expect(ActiveSupport::SecurityUtils.secure_compare("foo", "foo")).to eql(true)
      end
    end

    context 'when the given strings are not equal' do
      it 'returns false' do
        expect(ActiveSupport::SecurityUtils.secure_compare("foo", "bar")).to eql(false)
      end
    end
  end
end
