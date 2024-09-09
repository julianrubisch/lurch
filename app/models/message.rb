class Message < ApplicationRecord
  belongs_to :conversation
  delegated_type :messagable, types: %w[ Prompt Reply ]
end
