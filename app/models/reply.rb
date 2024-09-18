class Reply < ApplicationRecord
  include Messagable

  enum :status, [:pending, :completed], default: :pending

  belongs_to :prompt

  broadcasts_to ->(reply) { reply.message.conversation },
    target: ->(reply) { [reply.message.conversation, :messages] },
    partial: "messages/messagable/reply"
end
