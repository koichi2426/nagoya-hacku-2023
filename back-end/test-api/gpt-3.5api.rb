require "openai"

client = OpenAI::Client.new(access_token: "INSERT API KEY HERE")

response = client.chat(
  parameters:{
    model: "gpt-3.5-turbo",
    messages: [
      {role: "system", content: "あなたはAIアシスタントです。"},
      {role: "user", content: "ポケモンについて教えて"},
      {role: "system", content: "解答を100字程度で返してください。"}
    ],
  }
)

puts response.dig("choices", 0, "message", "content")
