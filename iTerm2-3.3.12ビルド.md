MacOS10.13(Xcode 10.1) で、iTerm2-3.3.12をビルドする

https://github.com/gnachman/iTerm2/releases/tag/v3.3.12

Swiftライブラリーが必要なので、以下をダウンロード、インストールします

https://support.apple.com/kb/DL1998

iTerm2.xcodeproj/project.pbxproj の HardenedRuntime を無効にします

以下６行を reg.txt としてコピーし　iTerm2-3.3.12 に保存します

::::::::::::::::::::::::  
/ENABLE_HARDENED_RUNTIME  
qaf=llcwNO  
nq20@a:wq  

:::::::::::::::::::::::::

以下をタイプ

cd iTerm2-3.3.12

vim -s reg.txt iTerm2.xcodeproj/project.pbxproj

vim +243 +s/RESULT/RESULT\;/ +wq sources/DVRDecoder.m

これで、MacOS10.13（Xcode 10.1) iTerm2.app(3.3.12)のビルド出来ます
