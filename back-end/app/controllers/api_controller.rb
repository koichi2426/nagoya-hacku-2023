class ApiController < ApplicationController
  def ask

    config = <<~CONFIG
    これからあなたには以上の目標を達成するためのプロセスを考えてもらいます。
    まず大まかに目標達成のプロセスを5つに分けてもらいます。
    この大まかに5つに分けられたプロセスをそれぞれ[Process]と定義します。
    つまり[Process1,Process2,Process3,Process4,Process5]が存在することになります。
    あなたにはJSON形式のプロンプトを書いてもらいます。以下にJSON形式を用意しました。""の内部に適切な文章を埋めてください。ただし埋める文章は最大20文字までとします。

    ＜注意＞
    ChatGPTあなたの返信は以下のJSON形式のみとします。必ず守るようにしてください。

    {
      "title": " ",
      "Process":{
        "Process1" : " ",
        "Process2" : " ",
        "Process3" : " ",
        "Process4" : " ",
        "Process5" : " ",
      }
    }
    CONFIG
    question = params[:question]

    response = generate_story(config, question)

    process = response["Process"]
    array = [process["Process1"], process["Process2"], process["Process3"], process["Process4"], process["Process5"]]

    mission = Mission.new
    mission.title = response["title"]
    mission.progress = 1
    mission.save

    array.each do |res|
      sub = SubMission.new
      sub.mission = mission
      sub.content = res
      sub.save
    end

    render :json => {
      "title": response["title"],
      "response": array,
    }
  end

  def generate_story(config, question)

    client = OpenAI::Client.new(access_token: "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")

    response = client.chat(
      parameters:{
        model: "gpt-3.5-turbo",
        messages: [
          {role: "system", content: config},
          {role: "user", content: question}
        ],
      }
    )
    json = JSON.parse(response.dig('choices', 0, 'message', 'content'))
    return json
  end
end
