class AI::Engine::OpenAI::Messages::Delete
  # Deletes an OpenAI Message by its ID.
  def self.call(remote_id:)
    response = client.messages.delete(id: remote_id)

    response["id"]
  end

  private_class_method def self.client
    @client ||= OpenAI::Client.new(
      access_token: AI::Engine::Engine.config.openai_access_token,
      organization_id: AI::Engine::Engine.config.openai_organization_id,
      log_errors: Rails.env.development? || Rails.env.test?,
      request_timeout: 2.minutes.to_i
    )
  end
end
