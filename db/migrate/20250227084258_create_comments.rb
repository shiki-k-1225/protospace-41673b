class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content, null: false # commentsのカラム
      t.references :user, null: false, foreign_key: true # userへの外部キー
      t.references :prototype, null: false, foreign_key: true # prototypeへの外部キー

      t.timestamps
    end
  end
end
