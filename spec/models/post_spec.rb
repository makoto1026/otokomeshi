require 'rails_helper'

describe Post do
  describe '#new' do

    it "タイトルがからの場合保存されない" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "材料が空の場合保存されない" do
      post = build(:post, material: nil)
      post.valid?
      expect(post.errors[:material]).to include("を入力してください")
    end

    it "レシピが空の場合保存されない" do
      post = build(:post, body: nil)
      post.valid?
      expect(post.errors[:body]).to include("を入力してください")
    end
  end
end
