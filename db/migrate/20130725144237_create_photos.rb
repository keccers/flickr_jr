class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :caption
      t.string :photo
      t.belongs_to :album
    end
  end
end
