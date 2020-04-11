class NgwordValidator < ActiveModel::EachValidator
  #カスタムバリエーションメソッド
  def validate_each(record, attribute, value)
      ngword = ['白だし', '豆板醤', 'オイスターソース', 'レモン汁', '塩麹', 'マスタード', 'コチュジャン', '生クリーム']
      if ngword.include?(value)
          record.errors[:attribute]<<'include ng word'
      end
  end
end