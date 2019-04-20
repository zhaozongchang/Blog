class AddFriendlyIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :friendly_id, :string
     add_index :posts, :friendly_id, :unique => true

     Post.find_each do |e|
       e.update( :friendly_id => SecureRandom.uuid )
     end
  end
end
