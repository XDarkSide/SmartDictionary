class CategoryItemsController < ApplicationController
  before_action :set_category_item, only: %i[ show edit update destroy ]

  # GET /category_items or /category_items.json
  def index
    @category_items = CategoryItem.all
  end

  # GET /category_items/1 or /category_items/1.json
  def show
  end

  # GET /category_items/new
  def new
    @category_item = CategoryItem.new
  end

  # GET /category_items/1/edit
  def edit
  end

  # POST /category_items or /category_items.json
  def create
    @category_item = CategoryItem.new(category_item_params)

    respond_to do |format|
      if @category_item.save
        format.html { redirect_to category_item_url(@category_item), notice: "Category item was successfully created." }
        format.json { render :show, status: :created, location: @category_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_items/1 or /category_items/1.json
  def update
    respond_to do |format|
      if @category_item.update(category_item_params)
        format.html { redirect_to category_item_url(@category_item), notice: "Category item was successfully updated." }
        format.json { render :show, status: :ok, location: @category_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_items/1 or /category_items/1.json
  def destroy
    # Знаходимо всі записи в WordsSet, які вказують на данний запис CategoryItem
    related_words_sets = WordsSet.where(category_item_id: @category_item.id)
  
    ActiveRecord::Base.transaction do
      # Видаляємо всі зв'язані записи в WordsSet
      related_words_sets.destroy_all
  
      # Видаляємо сам запис CategoryItem
      @category_item.destroy
  
      respond_to do |format|
        format.html { redirect_to category_items_url, notice: "Category item and its related WordSets were successfully destroyed." }
        format.json { head :no_content }
      end
    end
  rescue => e
    respond_to do |format|
      format.html { redirect_to category_items_url, alert: "Error occurred while destroying the category item: #{e.message}" }
      format.json { head :no_content, status: :unprocessable_entity }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_item
      @category_item = CategoryItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_item_params
      params.require(:category_item).permit(:categoryName)
    end
end
