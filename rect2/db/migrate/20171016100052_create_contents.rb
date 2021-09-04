class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
		t.string :name, null: false
		t.string :attachment, null: false
		t.string :content_type
		t.string :size
		t.integer :course_id

      t.timestamps
    end
	add_index('contents','course_id')
  end
end
