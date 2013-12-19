class AddReferences < ActiveRecord::Migration
  def change
    add_reference :fruits, :user, index: true
    add_reference :questions, :user, index: true
  end
end
