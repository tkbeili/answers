class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title, default: "default title"
      t.text :content

      t.timestamps
    end
  end
end
