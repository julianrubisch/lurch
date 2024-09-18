class Reply < ApplicationRecord
  include Messagable

  belongs_to :prompt

  broadcasts_to ->(reply) { reply.message.conversation },
    target: ->(reply) { [reply.message.conversation, :messages] },
    partial: "messages/messagable/reply"
end
