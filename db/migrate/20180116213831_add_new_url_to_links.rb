class AddNewUrlToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :new_url, :string
  end
end
