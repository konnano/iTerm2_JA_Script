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
 機械翻訳を修正する場合は半角文字は変更しないで下さい
 
 例 ねずみ: マウス: <= : は半角文字にして下さい
 
 順番など間違った場合はtrans.txt追加書き込みなので<br/>
 trans.txtを削除して最初からやり直して下さい<br/>
 翻訳、修正が終了したら以下を実行してくだい

 ```perl i_trance.pl 1```
 
 後はXcodeでビルドすれば日本語に出来てるはずです
 
 実行環境は OS10.13, Xcode10.1 しかないので<br/>
 妄想デバッグで出来る範囲でしか確認出来てません<br/>
 全てのバージョンでまともに動くのかすら分かりませんし<br/>
 iTerm2の仕様が変更されたらダメになるかもしれません

 失敗しても落ちてくれたら良いのですがレインボーカーソルクルクル<br/>
 無限ループになるかもしれないので、慌てず強制終了して下さい
 
 動作に不具合出るかもしれません、勇気のある方はチャレンジして下さい
 <br/><br/><br/>
\# 以下は単体で動かせば動作してくれますが、何故かi_trance.plスクリプト翻訳では失敗します<br/>
\# なのでsedの後半部分ををperlに変えてます

echo "The following tags are recognized: \&lt;u\&gt;, \&lt;i\&gt;, and \&lt;b\&gt;. You can also use \&amp;lt; and \&amp;amp;."|</br>
trans -b en:ja|<br/>
sed -e 's/&/\\\&amp;/g' -e 's/>/\\\&gt;/g' -e 's/</\\\&lt;/g'



