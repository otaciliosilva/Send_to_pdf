class CreateSubmitions < ActiveRecord::Migration[5.0]
  def change
    create_table :submitions do |t|
      t.string :Atividade
      t.string :Arquivo

      t.timestamps
    end
  end
end
