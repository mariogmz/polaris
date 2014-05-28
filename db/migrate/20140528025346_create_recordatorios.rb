class CreateRecordatorios < ActiveRecord::Migration
  def change
    create_table :recordatorios do |t|
      t.integer :user_id
      t.date :fecha_prestamo
      t.date :fecha_entrega
      t.string :contacto
      t.string :concepto
      t.string :detalle
      t.boolean :regresado

      t.timestamps
    end
  end
end
