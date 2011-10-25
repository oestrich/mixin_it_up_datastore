class CreateModels < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
    end

    create_table :users do |t|
      t.references :organization
      t.string :username
    end

    create_table :campaigns do |t|
      t.references :user
      t.string :name
    end

    create_table :surveys do |t|
      t.references :campaign
      t.string :name
      t.string :bson_id
    end

    create_table :responses do |t|
      t.references :survey
      t.boolean :complete
      t.string :bson_id
    end
  end
end
