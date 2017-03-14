class CreateVoices < ActiveRecord::Migration[5.0]
  def change
    create_table :voices do |t|
      t.string :name
      t.binary :wav
      t.string :lang

      t.timestamps
    end
  end
end
