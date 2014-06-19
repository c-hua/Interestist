class CreateSearchterms < ActiveRecord::Migration
  def change
    create_table :searchterms do |t|
      t.integer :search_id
      t.integer :term_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
