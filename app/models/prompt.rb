class Prompt < ApplicationRecord
  include Messagable

  has_one :reply
end
