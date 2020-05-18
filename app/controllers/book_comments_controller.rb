class BookCommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@comment = BookComment.new(book_comment_params)
		@comment.user_id = current_user.id
		@comment.book_id = @book.id
		if @comment.save
		   @user = User.find(@book.user_id)
		   redirect_to(book_path(@book.id),notice: "successfully created comment!")
		else
		   @user = User.find(@book.user_id)
		   @book = Book.find(@book.id)
		   @book_comment = BookComment.new
		   render "books/show"
		end
	end

	def destroy
		# byebug
		@book = Book.find(params[:book_id])
		# p @book
		@comment = @book.book_comments.find(params[:id])
		# p @comment
		@comment.destroy
		redirect_to(book_path(@book.id),notice: "successfully deleted comment!")
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment,:user_id,:book_id)
	end
end
