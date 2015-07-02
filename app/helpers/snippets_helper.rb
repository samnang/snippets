module SnippetsHelper
  def snippet_summary(snippet)
    snippet.content.truncate_words(15)
  end
end
