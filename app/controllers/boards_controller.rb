class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]
  def index
    # kaminariの使用。pageメソッドを呼ぶことにより、引数に指定したページに表示するデータだけを取得。デフォルトでは、1ページ辺り25件のデータを取得する
    @boards = Board.page(params[:page])
  end
  def new
    @board = Board.new
  end
  def create
    board = Board.create(board_params)
    flash[:notice] = "「#{board.title}」の掲示板を作成しました"
    # 特定のモデルの詳細画面にリダイレクトする場合はリダイレクトというメソッドの引数にオブジェクトを指定するだけで転送してくれる。パスを指定しても良い
    redirect_to board
  end
  def show
  end
  def edit
  end
  def update
    # インスタンス変数ではなく、ローカル変数に代入。今回のupdateアクションでは、viewに表示する必要がないから
    # updateメソッドで行う引数にはハッシュ形式でプロパティイ名と値の組を渡す
    @board.update(board_params)
    # 特定のモデルの詳細画面にリダイレクトする場合はリダイレクトというメソッドの引数にオブジェクトを指定するだけで転送してくれる。パスを指定しても良い
    redirect_to @board
  end
  def destroy
    @board.delete
    redirect_to boards_path, flash: {notice: "「#{@board.title}」の掲示板を作成しました"}
  end


  # ストロングパラメーター。意図していないparamsが渡ってくるのを防ぐ。フィルターをかけている
  private
  def board_params
    # paramsの中にある、boardキーのname,title,bodyの値のみ受け取る
    params.require(:board).permit(:name, :title, :body)
  end
  def set_target_board
    @board = Board.find(params[:id])
  end
end
