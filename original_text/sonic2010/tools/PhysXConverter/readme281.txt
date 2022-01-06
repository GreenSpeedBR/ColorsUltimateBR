PhysXConverter説明書(2.8.1版)

	○3dsmaxのPhysXプラグインによってエクスポートされたファイル(.xml,.nxb,.dae)の
	  座標系をZ-upからY-upに変換します。

	○ついでに違う形式のファイルに変換することも出来ます。

	○シーンの重力方向がZ軸マイナス方向のときに3dsmaxからのファイルであると判定します。
	  3dsmaxからのファイルでなければ、ファイルの形式の変換のみを行います。

使い方：
	コマンドラインで下記のコマンドを実行する。
		PhysXConverter.exe [options] Filename

	※ PhysX 2.8.1以上のSystemSoftwareがインストールされている必要があります。\\muse\Project\Sonic_x2\Sonic2010\soft\sdk\PhysXのPhysX_9.09.0408_SystemSoftware.exeをインストールしてください。

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

2010では、PhysXConverter -B -c Filenameでお願いします。

以上。
