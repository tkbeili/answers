class DeleteTitleFromAnswers < ActiveRecord::Migration
  def up
    remove_column  :answers, :title
  end

  def down
    add_column :answers, :title, :string
  end
end
