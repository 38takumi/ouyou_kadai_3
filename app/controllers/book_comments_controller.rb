class BookCommentsController < ApplicationController
  before_action :correct_book_comments,only: [:destroy]
  
  def create
    # 空のコメントを作る
    @book_comments_new = book_comments.new(book_comments_params)
    # コメントのidと現在のユーザーidが同じかどうか
    @book_comemnts_id = current_user.id
    # コメントする本のidとコメントidは同じかどうか
    @book_comments_new.user_id = @book_comments_id
    # 同じならsave
    @book_comments_new.save
    redirect_to book_path(@book_comments_new.user_id)
  end
  
  def destroy
    # book_commentsを特定する
    @book_comments_destroy = Book_comments.find(book_comments_params)
    @book_comments_destroy.destroy
    # flash[:notice] = "Book was successfully destroyed."
    redirect_to book_path(book_comments_destory.book)
  end
  
  def correct_book_comments
    @book_comments_destroy = Book_comments.find(params[:id])
    unless @book_comments_destroy.user.id == current_user.id
      # どこに飛ばせばいいかわからない
      redirect_to books_path
    end
  end
    
  private
  def book_comments_params
    params.require(:book_comments).permit(:user_comment, :book_comments_id)
  end  
    
end








# book詳細覧
# コメント入力欄
# 欄下に送信ボタン
# コメントは欄上
# destroyボタンも欄上　　　確認無し
#     自分の画像の下に自分のユーザー名、リンク付き、画像の隣にコメントその隣にdestoroyボタン
# 画面はコメント後も削除後もbook詳細

# ボタンは
# <% if @user.id == current_user.id %><% end %>
# で囲む
    
    