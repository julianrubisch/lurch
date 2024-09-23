class SummarizeJob < ApplicationJob
  queue_as :default

  def perform(conversation:)
    return if conversation.messages.count != 2
    return if conversation.messages.last.messagable.pending?

    client = OpenRouter::Client.new

    combined_convo = conversation.messages.map { _1.messagable.body }.join("\n------\n")

    response = client.complete([
      {role: "system", content: "Reply without any explanation"},
      {role: "user", content: "Please title this conversation using only a few words: #{combined_convo}"}
    ])

    conversation.update!(
      summary: response["choices"].first.dig("message", "content")
    )

    Turbo::StreamsChannel.broadcast_refresh_to conversation
  end
end
