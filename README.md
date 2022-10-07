 iTerm2のソースを書き換えて日本語化するPerlスクリプトです<br/>
 [**iTerm2**](https://github.com/gnachman/iTerm2)が公開されてるGitHubからXcodeのバージョンに対応する<br/>
 iTerm2のバージョンを探してダウンロードして下さい
 
 翻訳はGoogle任せなのでtranslate-shellが必要になります
 
 ```brew install translate-shell```
 
 ダウンロードしたiTerm2フォルダーにこのスクリプト置いて<br/>
 ターミナルでiTerm2フォルダーに入って以下を実行して下さい
 
 ```perl i_trance.pl```
 
 Google翻訳にかなり時間がかかります<br/>
 プロンプトが戻ってくるまでしばらくお待ちください<br/>
 翻訳が終了するとtrans.txtに対象文字列が入ってます<br/>
 順番にソースに挿入するので書き換えには注意して下さい<br/>
 機械翻訳を修正する場合は半角記号は変更しないで下さい
 
 例 ねずみ: マウス: <= : は半角記号にして下さい
 
 順番など間違った場合はtrans.txt追加書き込みなので<br/>
 trans.txtを削除して最初からやり直して下さい<br/>
 翻訳、修正が終了したら以下を実行してくだい

 ```perl i_trance.pl 1```
 
 後はXcodeでビルドすれば日本語に出来てるはずです
 <br/><br/>
 i2_trance.plはキー項目も日本語化しました、バージョンでファイル変更されてます<br/>

 ```prtl i2_trance.pl```

 trans.txtの修正で半角記号は変更しないで下さい<br/>
 新たに==記号はスペースの判定をするので前後の文字変更は大丈夫ですが前後の文字は必要です

 ```perl i2_trance.pl 1```
 
<br/>
 i3_trance.plで日本語化を増やしました、仕様はi2_trance.plと同じです 
<br/><br/>
 i4_trance.plは多言語Google翻訳対応の雛形です。
