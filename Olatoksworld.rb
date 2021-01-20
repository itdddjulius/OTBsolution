class Olatoksworld
  def self.GetEmptyColNum(toksHash, arrLength)
    colNum = 0;
    toksHash.each_with_index do |sub,col|
      nilCount = 0
      sub.each_with_index { |item,row |
        if toksHash[row][col] == "0" && toksHash[col][row] == "0" then
          next
        end
        if toksHash[row][col] == nil || toksHash[row][col] == "0" then
          nilCount = nilCount + 1
          if nilCount == arrLength
            colNum = col
            break
          end
        end
      }
      if nilCount == arrLength
        break
      end
    end
    colNum
  end

  def self.RemoveRowFromMatrix(toksHash, rowNum)
    toksHash.each_with_index do |item,col|
      toksHash[rowNum][col] = "0"
    end
    toksHash
  end
end