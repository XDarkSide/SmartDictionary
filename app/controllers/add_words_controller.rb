class AddWordsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :submit
  before_action :authenticate_user!
  def addWords
word_set_id = params[:id]  # Отримуємо id з маршруту

word_set_linked_ids = LinkedWordSet.where(words_sets_id: word_set_id).pluck(:word_id)  # Знаходимо всі id, відповідні даному words_set_id

@words = Word.where(id: word_set_linked_ids)  # Знаходимо всі значення word за id

@languages = Language.all

end

def submit
  word = params[:word]
  word_set1 = params[:word_set1]

  translation = params[:translation]
  word_set2 = params[:word_set2]

  time = DateTime.now

  wordObj = Word.new(word: word, created_at: time, updated_at: time, language_id: word_set1)

  if wordObj.save
    transObj = Translation.new(translation: translation, word_id: wordObj.id, created_at: time, updated_at: time, language_id: word_set2)

    if transObj.save

      linkedToSet = LinkedWordSet.new(word_id: wordObj.id, words_sets_id: params[:id], created_at: time, updated_at: time)
      puts params[:id]
      puts wordObj.id
      if linkedToSet.save
      redirect_to request.referer

      else 
        flash.now[:alert] = 'Помилка при збереженні перекладу.'
      render :create 
    end
    else
      flash.now[:alert] = 'Помилка при збереженні перекладу.'
      render :create
    end
  else
    flash.now[:alert] = 'Помилка при збереженні слова.'
    render :create
  end
end

end