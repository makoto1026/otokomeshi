class Ngword < ActiveHash::Base

  self.data = [
    {id: 1, name: '白だし'}, {id: 2, name: "豆板醤"}, {id: 3, name: "オイスターソース"},
    {id: 4, name: "レモン汁"}, {id: 5, name: "塩麹"}, {id: 6, name: "マスタード"},
    {id: 7, name: "コチュジャン"}, {id: 8, name: "生クリーム"}
  ]
  
end
