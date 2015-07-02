require 'rails_helper'

RSpec.describe Snippet, type: :model do
  describe 'validations' do
    it 'requires content' do
      blank_snippet = Snippet.new(content: nil)
      valid_snippet = Snippet.new(content: 'My snippet')

      expect(blank_snippet).to be_invalid
      expect(valid_snippet).to be_valid
    end

    it 'requires content to be less than max length' do
      snippet = Snippet.new(content: 'a' * (Snippet::MAX_LENGTH + 1))

      expect(snippet).to be_invalid
    end
  end

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
