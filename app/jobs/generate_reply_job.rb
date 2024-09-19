class GenerateReplyJob < ApplicationJob
  queue_as :default

  def perform(prompt:)
    client = OpenRouter::Client.new

    response = client.complete([
      {role: "user", content: prompt.body}
    ])

    prompt.reply.update!(
      body: response["choices"].first.dig("message", "content"),
      status: :completed
    )

    Turbo::StreamsChannel.broadcast_update_to prompt.message.conversation, target: "message-form-wrapper", content: ApplicationController.render(partial: "messages/form", locals: {conversation: prompt.message.conversation})
    # Turbo::StreamsChannel.broadcast_refresh_to prompt.message.conversation
  end
end
