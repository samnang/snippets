class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.recent.page(params[:page])
  end
end
