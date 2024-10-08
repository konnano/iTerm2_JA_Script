 iTerm2 のソースを書き換えて翻訳するPerlスクリプトです  
 [**iTerm2**](https://github.com/gnachman/iTerm2/tags) リリースから Xcode のバージョンに対応してる  
 iTerm2 のバージョンを探してダウンロードして下さい

![iterm2](https://github.com/konnano/iTrem2_JA_Script/assets/73874687/1d36ddc5-edd4-4349-b778-c1e7bf912e75)
 
 翻訳は Google 任せなので translate-shell が必要になります

[**HomeBrew**](https://brew.sh)からインストール
 
 ```brew install translate-shell```
 
 trans -T コマンドで翻訳先の言語を選んで my $Lang = 'ja'; を変更して下さい
 
 ダウンロードした iTerm2 のフォルダーに、このスクリプトを置いて<br/>
 ターミナルで iTerm2 フォルダーに入って、以下を実行して下さい

 ```perl i4_trance.pl```
 
 Google 翻訳にかなり時間がかかります<br/>
 プロンプトが戻ってくるまで、しばらくお待ちください<br/>
 (翻訳途中で終了する場合はCtrl+c、もしくはターミナルを閉じて下さい)  
 翻訳が終了すると trans.txt に対象文字列が入ってます<br/>
 順番にソースに挿入するので、書き換えには注意して下さい<br/>
 機械翻訳を修正する場合は半角記号は変更しないで下さい
 
 例 Mouse: ねずみ: <= : は半角記号にして下さい
  
 順番など間違った場合は trans.txt 追加書き込みなので<br/>
 trans.txt を削除して最初からやり直して下さい<br/>
 翻訳、修正が終了したら以下を実行してくだい

 ```perl i4_trance.pl 1```
 
 後はXcodeでビルドすれば翻訳出来てるはずです

 標準なら以下のフォルダーに iTerm2.appが作成されます

~/Library/Developer/Xcode/DerivedData/iTerm2-...../Build/Products/Development

アップデートされると英語に戻るのでメニュー項目を無効にしてます  
元のファイルは Interfaces/MainMenu.xib.buckup になります

google 翻訳の仕様変更で不具合が出るかもしれません  
問題がある場合はどこの国の言語がダメなのか教えて下さい
