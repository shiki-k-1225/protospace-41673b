Rails.application.routes.draw do
  devise_for :users

  # prototypes コントローラーのルーティングを定義
  resources :prototypes do
    # comments コントローラーを prototypes にネストし、create アクションのみを有効化
    resources :comments, only: [:create]

    # edit アクションと update アクションに必要なルーティングは自動生成されるので追記は不要
  end
  
  # users コントローラーのルーティングを定義
  resources :users, only: [:show]

  # ヘルスチェック用ルート
  get "up" => "rails/health#show", as: :rails_health_check

  # ルートパスを設定
  root to: "prototypes#index"
end
