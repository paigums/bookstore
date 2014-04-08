class BooksController < ApplicationController

before_action :set_book, only: [ :show, :edit, :update, :destroy ]


	def index
	@available_at = Time.now
	@books = Book.all
	end
	
	def show
  	#This is empty now     @book = Book.find(params[:id])
	end

	def new
	@book = Book.new
	end

	def create
	    @book = Book.new(book_params)
	    if @book.save
	    	#redirect_to @book
	      redirect_to @book, notice: "#{@book.title} was created!"
	    else
	      render :new
	    end
	end


	def edit
  	#This is empty now     @book = Book.find(params[:id])
	end


	def update
	    if @book.update(book_params)
	      #redirect_to @book
	      redirect_to @book, notice: "#{@book.title} was created!"
	    else
	      render :new
	    end
	end

	def destroy
	#This is empty now	  @book = Book.find(params[:id])
	@book.destroy
	redirect_to books_url
	end
 

private

	def book_params
	params.require(:book).permit(:title, :author, :pages, :price)
	end

	def set_book
	  @book = Book.find(params[:id])
	end
 
end