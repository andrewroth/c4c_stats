class Prcmethod < ActiveRecord::Base
  
  load_mappings
  has_many :prc, :class_name => 'Prc', :primary_key => _(:id), :foreign_key => _(:id)
  
  def self.find_methods()
    find(:all, :select => _(:description)).collect{ |m| [m.description] }
  end
  
  def self.find_method_id(description)
    find(:first, :conditions => {_(:description) => description})["#{_(:id)}"]
  end
  
  def self.find_method_description(id)
    find(:first, :conditions => {_(:id) => id})["#{_(:description)}"]
  end
  
end
