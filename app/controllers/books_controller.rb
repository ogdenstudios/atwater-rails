class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :new, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @authors = Author.all.map { |a| [a.full_name, a.id] }
    @genres = Genre.all.map { |g| g.name }
    @subgenres = Subgenre.all.map { |s| s.name }
  end

  # GET /books/1/edit
  def edit
    @authors = Author.all.map { |a| [a.full_name, a.id] }
    @genres = Genre.all.map { |g| g.name }
    @subgenres = Subgenre.all.map { |s| s.name }
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    # byebug
    respond_to do |format|
      if @book.save
        restrict_featured_covers(@book)
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        restrict_featured_covers(@book)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:service, :genre_id, :subgenre_id, :title, :old_filename, :featured, :picture, :author_id)
    end
    
    # Make sure there's only ever one featured book per author
    def restrict_featured_covers(book)
      if book.author.books.where(featured: true).count > 1 
        featured_books = book.author.books.where(featured: true)
        if (featured_books[0].updated_at > featured_books[1].updated_at)
          featured_books[1].update_column(:featured, false) 
        else 
          featured_books[0].update_column(:featured, false)
        end
      end
    end
end
