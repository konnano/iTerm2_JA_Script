MacOS14.2.1(Xcode 15.3) で、iTerm2-3.5.5 をビルドする

https://github.com/gnachman/iTerm2/releases/tag/v3.5.5

Xcode のアカウント設定をします
Xcode -> Preferences -> Accounts

以下をダウンロード、インストール

https://www.python.org/ftp/python/3.9.13/python-3.9.13-macos11.pkg

以下をタイプ

/Library/Frameworks/Python.framework/Versions/3.9/bin/pip3 install pyobjc

まず、ビルド

エラーが出てる15項目程のプルダウン Term名を自分に変更

Signing Certificate 、Developer ID Application: GEORGE NACHMAN を Apple Development に変更

以下をタイプ

cd iTerm2-3.5.5
git init  
git add .  
git commit -m "first commit"

iTerm2-3.5.5/submodules/iTerm2-shell-integration/ 以下が無いので個別にダウンロードします

githubページ iTerm2-master の submodules をクリック  
iTerm2-shell-integration をクリックして、そのページをダウンロード

iTerm2-shell-integration フォルダ内のファイルを全て  
iTerm2-3.5.5/submodules/iTerm2-shell-integration/ にコピー

Xcode を再起動

iTerm2-3.5.5/plists/iTerm2.plist が無いエラーが出る場合は、再ビルドして下さい

iTerm2-3.5.5/plists/iTerm2.plist が作られます。もし出来ない場合は

iTerm2-3.5.5/plists/dev-iTerm2.plist を使って下さい

cp iTerm2-3.5.5/plists/dev-iTerm2.plist iTerm2-3.5.5/plists/iTerm2.plist

これで MacOS14.2.1(Xcode 15.3) iTerm2-3.5.5 のビルド出来ます

________________________________________________________________________

python-3.9.13-macos11.pkgのアンインストール方法  
https://www.macupdate.com/how-to/uninstall-python
