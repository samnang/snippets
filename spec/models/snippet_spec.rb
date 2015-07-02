require 'rails_helper'

RSpec.describe Snippet, type: :model do
  describe '#recent' do
    it 'returns latest first' do
      Snippet.create(content: '1 day', created_at: 1.day.ago)
      Snippet.create(content: '1 minute', created_at: 1.minute.ago)

      results = Snippet.recent

      expect(results[0].content).to eq('1 minute')
      expect(results[1].content).to eq('1 day')
    end
  end
end
