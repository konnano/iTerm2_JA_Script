 iTerm2 のソースを書き換えて翻訳するPerlスクリプトです [English README is here ](https://github.com/konnano/iTrem2_JA_Script/blob/main/README.en.md)<br/>
 [**iTerm2**](https://github.com/gnachman/iTerm2) が公開されてる GitHub から Xcode のバージョンに対応してる<br/>
 iTerm2 のバージョンを探してダウンロードして下さい
 
 翻訳は Google 任せなので translate-shell が必要になります
 
 ```brew install translate-shell```
 
 trans -T で翻訳先の言語を選んで my $Lang = 'ja'; を変更して下さい
 
 ダウンロードした iTerm2 のフォルダーに、このスクリプトを置いて<br/>
 ターミナルで iTerm2 フォルダーに入って、以下を実行して下さい

 ```perl i4_trance.pl```
 
 Google 翻訳にかなり時間がかかります<br/>
 プロンプトが戻ってくるまで、しばらくお待ちください<br/>
 翻訳が終了すると trans.txt に対象文字列が入ってます<br/>
 順番にソースに挿入するので、書き換えには注意して下さい<br/>
 機械翻訳を修正する場合は半角記号は変更しないで下さい
 
 例 Mouse: ねずみ: <= : は半角記号にして下さい</br>
 == 半角記号はスペースの判定をするので、前後の文字変更は大丈夫ですが、前後の文字は必要です
 
 順番など間違った場合は trans.txt 追加書き込みなので<br/>
 trans.txt を削除して最初からやり直して下さい<br/>
 翻訳、修正が終了したら以下を実行してくだい

 ```perl i4_trance.pl 1```
 
 後はXcodeでビルドすれば翻訳出来てるはずです
