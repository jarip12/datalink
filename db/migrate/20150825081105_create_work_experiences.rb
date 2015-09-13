class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.date :start_day
      t.date :end_day
      t.string :company_name
      t.string :job_title
      t.integer :notary_related_id

      t.timestamps null: false
    end
  end
end
