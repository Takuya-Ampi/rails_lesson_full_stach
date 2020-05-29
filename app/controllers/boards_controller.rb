class BoardsController < ApplicationController
  def index
    # データベースのBoardテーブルにある全てのデータを取得する
    @boards = Board.all
  end
  def new
    @board = Board.new
  end
  def create
    Board.create(board_params)
  end

  # ストロングパラメーター。意図していないparamsが渡ってくるのを防ぐ。フィルターをかけている
  private
  def board_params
    # paramsの中にある、boardキーのname,title,bodyの値のみ受け取る
    params.require(:board).permit(:name, :title, :body)
  end
end
