class CreateMarkdownTexts < ActiveRecord::Migration
  def change
    create_table :markdown_texts do |t|
      t.string :name
      t.text :data

      t.timestamps
    end
  end
end
