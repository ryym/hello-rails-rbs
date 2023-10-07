class UsersController < ApplicationController
  def index
    users = User.order(:id)
    # ちゃんとエラーになる。
    # users.map { _1.hoge }

    # これだと型チェックが通っちゃう。インスタンス変数は untyped になる。
    @users = User.order(:id)
    @users.map { _1.hoge }
    # 現状だと、 sig ファイルを直接編集してインスタンス変数の型を明示するしかないっぽい？

    # インスタンス変数を多用してるコードベースには、
    # 何らかの工夫をしないと導入しづらそう。
  end
end
