class InformationLine < ActiveRecord::Base
  
  include RankedModel
  
  belongs_to :topic
  ranks :line_order, :with_same => :topic_id

  has_many :highlights

end
