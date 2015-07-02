class AddPrivateAndTokenIdToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :token_id, :string
    add_index :snippets, :token_id, unique: true

    add_column :snippets, :private, :boolean, default: false
  end
end
