class Kind < ActiveRecord::Base
  has_many :announces, dependent: :destroy
end
