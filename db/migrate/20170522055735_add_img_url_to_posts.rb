class AddImgUrlToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :img_url, :string, default:""
  end
end
