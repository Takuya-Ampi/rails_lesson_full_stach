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
  def show
    @board = Board.find(params[:id])
  end
  def edit
    @board = Board.find(params[:id])
  end
  def update
    # インスタンス変数ではなく、ローカル変数に代入。今回のupdateアクションでは、viewに表示する必要がないから
    board = Board.find(params[:id])
    # updateメソッドで行う引数にはハッシュ形式でプロパティイ名と値の組を渡す
    board.update(board_params)
    # 特定のモデルンボ詳細画面にリダイレクトする場合はリダイレクトというメソッドの引数にオブジェクトを指定するだけで転送してくれる。パスを指定しても良い
    redirect_to board
  end


  # ストロングパラメーター。意図していないparamsが渡ってくるのを防ぐ。フィルターをかけている
  private
  def board_params
    # paramsの中にある、boardキーのname,title,bodyの値のみ受け取る
    params.require(:board).permit(:name, :title, :body)
  end
end
