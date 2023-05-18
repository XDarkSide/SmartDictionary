class CreateWordsSetController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :submit
    def createSet  
        @categories = Category.all
    end

    def submit
        @categories = Category.all
      
        name = params[:name]
        description = params[:description]
        category_id = params[:category]
      
        words_set = WordsSet.new(setName: name, description: description, Category_id: category_id)
      
        if words_set.save
          redirect_to addWords_path(id: words_set.id)
        else
          flash.now[:alert] = 'Помилка при збереженні набору слів.'
          render :create
        end
      end      
end