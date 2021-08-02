class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      
      user_comment:text
      user_comment_id:integer

      t.timestamps
    end
  end
end
