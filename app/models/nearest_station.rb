class NearestStation < ApplicationRecord
  belongs_to :property
  accepts_nested_attributes_for :property
end
