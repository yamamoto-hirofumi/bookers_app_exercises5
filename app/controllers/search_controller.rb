class SearchController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == "user"
        @dates = User.search_for(@content, @method)
    else
        @dates = Book.search_for(@content, @method)
    end
  end
end
