class AdobeAccount < ActiveRecord::Base
  has_and_belongs_to_many :computer
end
