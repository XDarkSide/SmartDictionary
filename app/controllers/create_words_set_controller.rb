class CreateWordsSetController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :submit
  before_action :authenticate_user!

  def createSet  
    @categories = CategoryItem.all
  end

  def submit
    @categories = CategoryItem.all

    name = params[:name]
    description = params[:description]
    category_id = params[:category]

    time = DateTime.now
    words_set = WordsSet.new(setName: name, description: description, category_item_id: category_id, created_at: time, updated_at: time, capacity: 0)

    puts "WordsSet attributes:"
      puts "ID: #{words_set.id}"
      puts "Set Name: #{words_set.setName}"
      puts "Description: #{words_set.description}"
      puts "Category Item ID: #{words_set.category_item_id}"
      puts "Created At: #{words_set.created_at}"
      puts "Updated At: #{words_set.updated_at}"
      puts "Capacity: #{words_set.capacity}"

    if words_set.save

      linked_set = LinkedSet.create(words_set_id: words_set.id, user_id: current_user.id, created_at: time, updated_at: time)

    if linked_set.save
    redirect_to addWords_path(id: words_set.id)
    else
    flash.now[:alert] = 'Помилка при збереженні набору слів.'
    render :create
    end

     
    else
      flash.now[:alert] = 'Помилка при збереженні набору слів.'
      render :create
    end
  end
end
