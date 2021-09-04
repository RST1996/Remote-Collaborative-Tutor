class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index('tutors',['user_id','course_id'],:unique=>true)
    add_index('requests',['user_id','course_id'],:unique=>true)
  end
end
