class BooksController < ApplicationController
before_action :authenticate_user!

  def show
  	@book = Book.find(params[:id])
    @user = User.find(@book.user.id)
    @book_comment = BookComment.new
  end

  def index
  	@books = Book.all #一覧表示するためにBookモデルの情報を全てくださいのall
    @book = Book.new
  end

  def create
  	@book = Book.new(book_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
  	@user = User.find(current_user.id)
    @book.user_id = current_user.id #bookにuser.idを渡すことで、データベースにuser.idが保存される
    if @book.save #入力されたデータをdbに保存する。
  		redirect_to(book_path(@book.id), notice: "successfully created book!")#保存された場合の移動先を指定。

  	else
  		@books = Book.all
  		render :index
  	end
  end

  def edit
  	  @book = Book.find(params[:id])
      if @book.user_id == current_user.id
      
      else
        redirect_to books_path
    end
  end

  def book_search
   # userのコントローラーでsearchするので不要
  end




  def update
  	@book = Book.find(params[:id])
  	if @book.user_id == current_user.id
       if @book.update(book_params)
  		    redirect_to @book, notice: "successfully updated book!"
        else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
      		render "edit"
        end
    else
      @book = Book.find(params[:id])
      @user = User.find(@book.user_id)
      @book_comment = BookComment.new
      render "show"
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body,:user_id)
  end

end
