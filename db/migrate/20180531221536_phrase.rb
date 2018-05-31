class Phrase < ActiveRecord::Migration
  
  def change
    create_table :phrases do |t|
      t.string :value
    end

  end
  
end
