require 'sqlite3'
require 'json'

db = SQLite3::Database.new('../db/development.sqlite3')

results = db.execute('SELECT * FROM missions')

data = []

results.each do |row|
  item_hash = {
    id: row[0],
    title: row[1],
    progress: row[2]
  }
  data << item_hash
  puts "ID: #{row[0]}, Title #{row[1]}, Progress #{row[2]}"
end

#json dataで書き出し
json_data = data.to_json
file_path = "output.json"
File.open(file_path, 'w') do |file|
  file.write(json_data)
end

# (db access) mission = Mission.all
# mission.each do |row|
# (access db data)
# row.id          Mission ID
# row.title       Mission's Title
# row.progress    Mission Progress
# row.created_at  Time of Mission's created
# row.updated_at  Time of Mission's updated
# end

# .allで取得する場合
# json_data = mission.to_json
# File.open('file_path', 'w') do |file|
#   file.write(json_data)
# end

## json file ..

require 'sqlite3'
require 'json'

# SQLite3データベースファイルへのパスを指定します。
db1 = SQLite3::Database.new('path_to_db1.db')
db2 = SQLite3::Database.new('path_to_db2.db')

# JSONデータを格納するハッシュを初期化します。
json_data = {}

# DB1から目標情報を取得します。
db1.execute('SELECT id, title FROM Mission') do |mission_id, title|
  goal_key = "goal#{mission_id}"
  json_data[goal_key] = { "title" => title, "Progress" => {} }

  # DB2からサブミッション情報を取得します。
  db2.execute('SELECT content FROM SubMission WHERE mission = ?', mission_id) do |content|
    process_key = "Process#{json_data[goal_key]["Progress"].size + 1}"
    json_data[goal_key]["Progress"][process_key] = content
  end
end

# 最終的なJSONデータを表示します。
puts JSON.pretty_generate(json_data)
