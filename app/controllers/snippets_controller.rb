class SnippetsController < ApplicationController
  respond_to :html, :json

  def index
    @snippets = Snippet.recent.public.page(params[:page])
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.save
    respond_with @snippet
  end

  def show
    @snippet = Snippet.find_by!(token_id: params[:id])
  end

  private

  def snippet_params
    params.require(:snippet).permit(:content, :private)
  end
end
