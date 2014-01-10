class Topic < ActiveRecord::Base

  has_ancestry
  has_many :information_lines

  default_scope order('title ASC')
  
end
