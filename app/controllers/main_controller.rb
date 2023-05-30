class MainController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :submit
    skip_before_action :verify_authenticity_token, only: :delete

    def hello
        begin
            linkedSets = LinkedSet.where(User_id: current_user.id).pluck(:id)
            @sets = WordsSet.where(id: linkedSets)
            puts @sets
          rescue NoMethodError
            # Ігноруємо помилку NoMethodError, якщо current_user є nil
            puts "Current user is nil"
          end
          
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