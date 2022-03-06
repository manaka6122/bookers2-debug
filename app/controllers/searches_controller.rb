class SearchesController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
    if @model == 'user'
      @recodes = User.search_for(@content, @method)
    else
      @recodes = Book.search_for(@content, @methoed)
    end
  end
  
  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      else
        Book.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end
