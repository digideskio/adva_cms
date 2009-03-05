class CreateTicketTables < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.references :site
      t.references :section
      t.string     :title
      t.string     :desc
      t.integer    :tickets_count,    :defoult => 0
      t.integer    :milestones_count, :default => 0
      t.timestamps
    end
    
    create_table :tickets do |t|
      t.references :user
      t.references :section
      t.integer    :ticketable_id,   :null => false
      t.string     :ticketable_type, :null => false
      t.integer    :author_id
      t.string     :author
      t.string     :title
      t.text       :body
      t.text       :body_html
      t.string     :filter
      t.string     :state
      t.string     :states
      t.integer    :assignments_count, :default => 0
      t.timestamps
    end
    
    create_table :assignments do |t|
      t.references :ticket
      t.references :user
      t.timestamps
    end
    
    create_table :milestones do |t|
      t.references :project
      t.string     :title
      t.string     :desc
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
    drop_table :tickets
    drop_table :assignments
    drop_table :milestones
  end
end