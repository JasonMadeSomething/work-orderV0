class CreatePostageTypes < ActiveRecord::Migration
  def change
    create_table :postage_types do |t|

      t.timestamps
    end
  end
end
