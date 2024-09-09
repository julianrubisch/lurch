module Messagable
  extend ActiveSupport::Concern

  included do
    has_one :message, as: :messagable, touch: true
  end
end
