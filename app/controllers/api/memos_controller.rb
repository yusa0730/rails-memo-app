class Api::MemosController < ApplicationController
  def index
    # orderはデータを並び替えたいときに使うメソッドです。DESCは降順に並び替えるという意味になります。
    # つまり、order('created_at DESC') というコードで、created_atが降順(データが作成された順番)に並び替えています。
    @memos = Memo.order("created_at Desc")
  end

  def create
    @memo = Memo.create(memo_params)
    # saveメソッドは保存がうまくいったらtrue、保存に失敗したらfalseを返します。
    # status: :created や status: :unprocessable_entity でステータスを付与しています。
    # ステータスを付与することで処理が成功したり、失敗したことを示すことができます。
    if @memo.save
      render :show, status: :created
    else
      render json: @memo.errors, status: :unprocessable_entity
    end
  end

  private 
    def memo_params
      # paramsとは送られてきたリクエスト情報をひとまとめにしたものです。
      # permitで変更可能なキーを指定します。今回の場合、titleキーとdescriptionキーを指定しています。
      params.permit(:title, :description)
    end
end
