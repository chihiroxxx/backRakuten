class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :booktitle
      t.string :author
      t.string :bookimage
      t.string :thoughts
      t.datetime :date


      t.timestamps
    end
  end
end
