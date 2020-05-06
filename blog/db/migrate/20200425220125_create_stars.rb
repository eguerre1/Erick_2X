class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
