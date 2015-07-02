require 'rails_helper'

RSpec.describe SnippetsHelper, type: :helper do
  describe '#snippet_summary' do
    it 'returns summary of snippet' do
      long_snippet = Snippet.create(content: '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16')

      result = helper.snippet_summary(long_snippet)

      expect(result).not_to include('16')
    end
  end
end
