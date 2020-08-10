class RfidContainer < ApplicationRecord
  def self.search(search)
    return RfidContainer.all unless search
    RfidContainer.where("DATE(created_at) = '#{search[:daily]}'") unless search[:daily].nil?
    
  end
end