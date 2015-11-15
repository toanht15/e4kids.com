class CreateVocabularies < ActiveRecord::Migration
  def change
    create_table :vocabularies do |t|
      t.string :word
      t.string :mean
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
