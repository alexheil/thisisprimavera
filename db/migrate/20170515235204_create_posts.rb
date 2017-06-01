class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
    	t.string :title
      t.string :author
      t.string :image
      t.text :subtitle
      t.text :content
      t.string :slug

      t.timestamps
    end

    add_index :posts, :slug
  end
end
