class Updateuers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :admin_role, :boolean, default: false
    add_column :users, :teacher_role, :boolean, default: false
    add_column :users, :tutor_role, :boolean, default: false
    add_column :users, :student_role, :boolean, default: true
  end
end
