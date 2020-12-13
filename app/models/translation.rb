class Translation < ApplicationRecord
  belongs_to :translation_key
  belongs_to :translation_scope
  belongs_to :language
end
