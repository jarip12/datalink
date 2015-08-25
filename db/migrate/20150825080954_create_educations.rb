class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :education_type
      t.string :school_name
      t.string :degree
      t.date :enroll_day
      t.date :graduation_day

      t.timestamps null: false
    end
  end
end
