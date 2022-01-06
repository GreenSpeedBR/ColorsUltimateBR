PhysX270Converter説明書

	○3dsmaxのPhysXプラグインによってエクスポートされたファイル(.xml,.nxb,.dae)の
	  座標系をZ-upからY-upに変換します。

	○ついでに違う形式のファイルに変換することも出来ます。

	○シーンの重力方向がZ軸マイナス方向のときに3dsmaxからのファイルであると判定します。
	  3dsmaxからのファイルでなければ、ファイルの形式の変換のみを行います。

使い方：
	コマンドラインで下記のコマンドを実行する。
		PhysX270Converter.exe [options] Filename

	※ PhysX 2.7.0以上のSystemSoftwareがインストールされている必要があります。

オプション：
	-o Filename
		出力ファイル名指定（デフォルトは元ファイル名に"_conv"が付く）
	-b または -binary
		バイナリファイル(.nxb)を出力
	-B または -big
		ビッグエンディアンのバイナリファイルを出力
	-d または -collada
		COLLADAファイル(.dae)を出力
	-x または -xml
		XMLファイル(.xml)を出力（デフォルトの動作）
	-c または -cook
		Cookingされたデータを出力

以上。
