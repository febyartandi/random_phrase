class CreateSessionPhrases < ActiveRecord::Migration
  def change
    create_table :session_phrases do |t|
      t.string :session_key
      t.references :phrase
      t.timestamps null: false
    end
  end
end
