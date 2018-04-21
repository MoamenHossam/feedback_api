class Feedback < ApplicationRecord
#  belongs_to :company ,:touch true
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  auto_increment :number, scope: [:company_token], before: :create
  settings do

  mappings dynamic: false do
    indexes :company_token, type: :text
  end
end


end
