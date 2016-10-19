class MarkdownController < ApplicationController
  before_action :auth!, only: [:create, :update, :destroy]

  def show
    render json: MarkdownText.find_by(name: params[:id])
  end

  def update
    markdown = MarkdownText.find_by(name: params[:id])
    if markdown
      markdown.update(markdown_params)
      render json: markdown
    else
      render nothing: true, status: :not_found
    end

  end

  private
  def markdown_params
    params.require(:markdown).permit(:data)
  end
end
