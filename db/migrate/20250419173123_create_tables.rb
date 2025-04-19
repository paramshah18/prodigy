class CreateTables < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :category
      t.string :frequency
      t.string :duration
      t.timestamps
    end

    create_table :program_days do |t|
      t.references :activity, null: false, foreign_key: true
      t.integer :day
      t.timestamps
    end


    create_table :activity_completions do |t|
      t.references :activity, null: false, foreign_key: true
      t.integer :day
      t.boolean :completed, default: false
      t.timestamps
    end
    
  end
end
