# dockerでのrails環境構築レポジトリ

## 手順

### 1 git clone

### 2 カレントディレクトリがdocker-compose.ymlファイル上になるように移動する

### 3 ```docker-compose run web rails new . --force --database=mysql```

### 4 ```docker-compose build```

### 5 config/database.ymlを編集するためエディタでrailsディレクトリを開く

### 6 以下のコードを確認する(多分12行目くらい。readmeだと横並びになってるが、

```default: &default```  
``` adapter: mysql2```  
``` encoding: utf8```  
``` pool: 5```  
``` username: root```  
``` pasword: ```  
``` host: localhost```  

### 7 次のように編集する(編集したら保存する)

```default: &default```  
``` adapter: mysql2```  
``` encoding: utf8```  
``` pool: 5```  
``` username: root```  
``` pasword: password ```  
``` host: db```  

### 8 ```docker-compose up -d```

### 9 ```docker-compose ps``` (起動を確認する。rails_db_1とrails_web_1のStateがUpになってたらOK)

### 10 ```docker-compose run web bundle exec rake db:create```

### 11 ```localhost:3000```　とchrome等のブラウザに打ち込みrailsの起動画面が表示されれば環境構築完了


