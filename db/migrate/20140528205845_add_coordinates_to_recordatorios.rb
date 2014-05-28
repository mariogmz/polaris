class AddCoordinatesToRecordatorios < ActiveRecord::Migration
  def change
    add_column :recordatorios, :lat, :decimal
    add_column :recordatorios, :long, :decimal
  end
end
