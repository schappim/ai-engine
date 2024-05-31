class CreateAIEngineAssistants < ActiveRecord::Migration[7.1]
  def change
    create_table :ai_engine_assistants do |t|
      t.string :remote_id, null: false
      t.belongs_to :assistable, polymorphic: true

      t.timestamps
    end

    add_index :ai_engine_assistants, %i[assistable_type assistable_id remote_id], unique: true
  end
end