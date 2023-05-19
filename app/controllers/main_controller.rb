class MainController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :submit
    skip_before_action :verify_authenticity_token, only: :delete

    def hello
        @sets = WordsSet.all
        puts @sets
    end

    def submit
        redirect_to '/create'
    end

    def delete
    set = WordsSet.find(params[:set_id])
    wordsSet = LinkedWordSet.where(WordsSet_id: set.id)

    wordsSet.destroy_all
    set.destroy

    redirect_to root_path
      end
end