class CreateExercise < ActiveRecord::Migration
    def up
        create_table :exercises do |t|
            t.string :name
            t.string :muscle
            t.string :description
            t.timestamps
        end
    end
    
    def down
        drop_table :exercises
    end
end