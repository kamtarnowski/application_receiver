class AddStatusToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :status, :string, default: 'unread'
  end
  add_index :submissions, :status
end
