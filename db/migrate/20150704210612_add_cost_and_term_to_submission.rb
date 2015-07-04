class AddCostAndTermToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :cost, :integer
    add_column :submissions, :term, :datetime
  end
end
