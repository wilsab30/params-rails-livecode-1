class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.string :body
      t.string :author
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
