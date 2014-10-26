class CreateUserJobs < ActiveRecord::Migration
  def change
    create_table :user_jobs, id: false do |t|
      t.integer :user_id
      t.integer :job_id
    end
  end
end
