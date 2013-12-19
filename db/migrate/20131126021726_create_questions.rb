class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :pregunta
      t.string :respuesta

      t.timestamps
    end
  end
end
