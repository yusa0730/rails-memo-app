class Api::MemosController < ApplicationController
  def index
    # orderはデータを並び替えたいときに使うメソッドです。DESCは降順に並び替えるという意味になります。
    # つまり、order('created_at DESC') というコードで、created_atが降順(データが作成された順番)に並び替えています。
    @memos = Memo.order("created_at Desc")
  end
end
