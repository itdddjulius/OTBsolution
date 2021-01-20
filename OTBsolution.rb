require_relative 'Olatoksworld'

def main

puts "Enter Jobs e.g a,b>c,d>a"
str = gets
outputStr = ""

splitStr = str.split(',')
leftCharArray =  []
rightCharArray = []
dependentNodes = []

splitStr.each do |item|
  if item.include? ">" then
    splitInArray = item.split('>')
    leftCharArray << splitInArray[0]
    dependentNodes << splitInArray[0]
    if splitInArray[1].include? "\n" then
      splitInArray[1].delete!("\n")
    end
    if splitInArray[0] == splitInArray[1]
      raise "ERROR = Jobs MUST NOT depend on themselves"
      exit(true)
    end
    rightCharArray << splitInArray[1]
    if dependentNodes.include? splitInArray[1]
      if rightCharArray.include?(splitInArray[0])
        ind  = leftCharArray.index(splitInArray[0])
        if rightCharArray[ind] != ""
          raise "ERROR = Jobs MUST NOT have circular dependencies"
          exit(true)
        end
      end
    end

    splitInArray.clear
  else
    if item.include? "\n" then
      item.delete!("\n")
    end
    leftCharArray << item
    rightCharArray << ""
  end
end
l = leftCharArray.length
toksHash = Array.new(l){Array.new(l)}

rightCharArray.each_with_index do |item, i|
  if item != "" then
    rindex = leftCharArray.index(item)
    cindex = i
    toksHash[rindex][cindex] = "1"
  end
end

leftCharArray.each_with_index do |item, i|
  colNum = Olatoksworld.GetEmptyColNum(toksHash, l)
  outputStr = outputStr + leftCharArray[colNum]
  toksHash = Olatoksworld.RemoveRowFromMatrix(toksHash, colNum)
end

puts "Last String: #{outputStr}"

end

main