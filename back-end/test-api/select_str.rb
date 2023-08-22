str = <<~TEXT
了解しました。以下に示します。
@@@{
    "goal1":{
        "title": "目標",
        "Process":{
            "Process1" : "プロセス1",
            "Process2" : "プロセス2",
            "Process3" : "プロセス3",
            "Process4" : "プロセス4",
            "Process5" : "プロセス5",
            "Process1-1" : "プロセス1-1",
            "Process1-2" : "プロセス1-2",
            "Process1-3" : "プロセス1-3",
            "Process1-4" : "プロセス1-4",
            "Process1-5" : "プロセス1-5",
            "Process2-1" : "プロセス2-1",
            "Process2-2" : "プロセス2-2",
            "Process2-3" : "プロセス2-3",
            "Process2-4" : "プロセス2-4",
            "Process2-5" : "プロセス2-5",
            "Process3-1" : "プロセス3-1",
            "Process3-2" : "プロセス3-2",
            "Process3-3" : "プロセス3-3",
            "Process3-4" : "プロセス3-4",
            "Process3-5" : "プロセス3-5",
            "Process4-1" : "プロセス4-1",
            "Process4-2" : "プロセス4-2",
            "Process4-3" : "プロセス4-3",
            "Process4-4" : "プロセス4-4",
            "Process4-5" : "プロセス4-5",
            "Process5-1" : "プロセス5-1",
            "Process5-2" : "プロセス5-2",
            "Process5-3" : "プロセス5-3",
            "Process5-4" : "プロセス5-4",
            "Process5-5" : "プロセス5-5",
        }
    }
}@@@
以上が目標の達成のために必要なことです。
TEXT

#puts str
#puts "matching str\n"
matchstr = str.match(/@@@(.*?)@@@/m)[1]

file_path = './output.txt'
file2_path = './goal_count.txt'
file2_read = File.read(file2_path)
goal_cnt = file2_read.match(/\d+/)[0].to_i
puts goal_cnt

#既にデータが入っているか確認
if goal_cnt != 0
    lines = File.readlines(file_path)
    #puts lines
    puts "not nil"
    lines.pop
    lines[-1] = "\t},"
    split_str = matchstr.split("\n", 2)
    matchstr = split_str[1]
    File.open(file_path, 'w') do |file|
        file.puts lines
    end
    write_file = File.open(file_path, 'a')
    write_file.puts matchstr
    write_file.close
else
    puts "nil"
    write_file = File.open(file_path, 'w')
    write_file.puts matchstr
    write_file.close
end

goal_cnt += 1
write_file2 = File.open(file2_path, 'w')
write_file2.puts goal_cnt
write_file2.close

#puts matchstr
