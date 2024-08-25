MacOS10.15（Xcode 12.4)で、iTerm2-3.4.23をビルドする

https://github.com/gnachman/iTerm2/releases/tag/v3.4.23

Xcodeのアカウント設定が必要なのか分かりませんが設定しておきましょう  
Xcode -> Preferences -> Accounts

GUIパッケージをダウンロードしてインストール

https://www.python.org/ftp/python/3.9.13/python-3.9.13-macos11.pkg

以下のコマンドをタイプしモジュールをインストール

/Library/Frameworks/Python.framework/Versions/3.9/bin/pip3 install pyobjc

以下をタイプ

cd iTerm2-3.4.23

vim +1257 +s/const/\\\\/\\\\/const/ +1258 +s/safeAreaInsets.top/0/ +wq sources/iTermRootTerminalView.m

vim +97 +s/self.safeAreaInsets.top/0/ +wq sources/NSScreen+iTerm.m

vim +113 +s/self.safeAreaInsets.top/0/ +wq sources/NSScreen+iTerm.m

git init
git add .
git commit -m "first commit"

これで、MacOS10.15（Xcode 12.4) iTerm2.app(3.4.23)のビルド出来ます  
＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿_____

MacOS14.0(Xcode 15.0)以降で、iTerm2-3.4.23をビルドする

Xcodeのアカウント設定が必要なのか分かりませんが設定しておきましょう  
Xcode -> Preferences -> Accounts

GUIパッケージをダウンロードしてインストール

https://www.python.org/ftp/python/3.9.13/python-3.9.13-macos11.pkg

以下のコマンドをタイプしモジュールをインストール

/Library/Frameworks/Python.framework/Versions/3.9/bin/pip3 install pyobjc

iTerm2-3.4.23に移動しgitにコミットする

cd iTerm2-3.4.23
git init
git add .
git commit -m "first commit"

iTerm2-3.4.23/tools/updateVersion.py 35行目以降でエラーが出るのでコメントにします  
一旦ビルド出来ればコメントアウトして2回、リビルドすればバージョン表示されます

"""  
plist["CFBundleShortVersionString"] = version  
plist["CFBundleGetInfoString"] = version  
plist["CFBundleVersion"] = version  
plist.writeToFile_atomically_(path, 1)  
"""

これで、MacOS14.0（Xcode 15.0)以降 iTerm2.app(3.4.23)のビルド出来ます
__________________________________________________________________________

MacOS10.15（Xcode 12.4) は大丈夫なのですが  
MacOS14.0 (Xcode(15.0) 以降では何故かプルダウンメニューが完全に表示されません

Preferences -> Point -> Bindings メニュー項目クリック
__________________________________________________________________________

python-3.9.13-macos11.pkgのアンインストール方法  
https://www.macupdate.com/how-to/uninstall-python
