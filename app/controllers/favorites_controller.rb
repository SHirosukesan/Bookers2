class FavoritesController < ApplicationController
	def create
		book = Book.find(params[:book_id])
    	favorite = current_user.favorites.new(book_id: book.id)
    	favorite.save
    	redirect_to book_favorites_path(book)
	end

	def destroy
		 book = Book.find(params[:book_id])
	     favorite = current_user.favorites.find_by(book_id: book.id)
	     favorite.destroy
	     redirect_to book_favorites_path(book)
	end
end



# コントローラ
# favoritesコントローラを追加@
# createアクションを追加@
# 用途：いいねを作成する
# destroyアクションを追加@
# 用途：いいねを削除する
# いいねを作成, いいねを削除した後は、行う前にいた画面に遷移すること