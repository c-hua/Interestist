class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :text
      t.integer :search_id
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id

      t.timestamps
    end
  end
end
