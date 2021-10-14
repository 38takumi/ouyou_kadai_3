class Book < ApplicationRecord
 belongs_to :user
 has_many :book_comments, dependent: :destroy
 has_many :favorites, dependent: :destroy
 
 # いいねを押したuser.idを全て取得、条件に当てはまるかどうか
 def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
   # favorites.exists?(user_id: user.id)
 end
 
 # いいねを押したuser.idを全て取得、条件に当てはまるかどうか
 # def favorited_by?(user)
 #   self.favorites.exists?(user_id: user.id)
 # end
 
 validates :title, presence: true

 validates :body, presence: true
 validates :body, length: { maximum: 200 }
end