RSpec.describe ActiveSupport do
  describe "::is_fast?" do
    it 'returns true' do
      expect(ActiveSupport.is_fast?).to eql(true)
    end
  end
end
