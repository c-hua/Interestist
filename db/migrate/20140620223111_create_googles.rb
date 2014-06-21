class CreateGoogles < ActiveRecord::Migration
  def change
    create_table :googles do |t|

      t.timestamps
    end
  end
end
