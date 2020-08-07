class BookCommentController < ApplicationController
	def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book.id)
	end

	def destroy
	BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
	end

	private
	def book_comment_params
	    params.require(:book_comment).permit(:comment)
	end
end

# 用途：コメントを作成する
# 用途：コメントを削除する
# 自分のコメントしか削除できないこと
# コメント, コメント削除後は行う前の画面に遷移すること
# book_commentモデルを追加 空のコメントは保存できないこと