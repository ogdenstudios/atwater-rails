class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

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
    @authors = Author.all
  end

  # GET /books/1/edit
  def edit
    @authors = Author.all
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @authors = Author.all
    respond_to do |format|
      if @book.save
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
        # HACK: make sure there's only ever one featured book per author
        if @book.featured == true 
          author = @book.author
          if author.books.where(featured: true).count > 1 
            featured_books = author.books.where(featured: true)
            book0 = featured_books[0]
            book1 = featured_books[1]
            if (book0.updated_at > book1.updated_at)
              book1.featured = false 
              book1.save!
            else 
              book0.featured = false 
              book0.save!
            end
          end
        end
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
      params.require(:book).permit(:work_done, :genre, :title, :old_filename, :featured, :picture)
    end
end
