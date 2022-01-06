Rem 定数(ここの処理を外部設定ファイルからの読み込みにして良いかも・・・)
Const Dest = "\2010Copy"
Const ViewerBat = "\Viewer2010\ViewerNDEV.bat"
Const ViewerBin = "\Viewer2010\bin"
Const ViewerDvd = "\Viewer2010\dvdroot"
Const DocumentDesign = "\Documents\design"
Const Artworks = "\Sonic2010\artworks"
Const Dvd = "\Sonic2010\dvd"
Const DvdImage = "\Sonic2010\dvd_builder_image"
Const Elf = "\Sonic2010\elf"
Const ElfBat = "\Sonic2010\RVL_ElfRun.bat"
Const ElfRBat = "\Sonic2010\RVL_ElfRun_R.bat"
Const Plugins = "\Sonic2010\plugins"
Const Tools = "\Sonic2010\tools"

Rem 環境変数の取得
Dim fileStream,wshShell,src, dst, copyArray, copyfileArray
Set fileStream = WScript.CreateObject("Scripting.FileSystemObject")
Set wshShell = WScript.CreateObject("WScript.Shell")
src = wshShell.ExpandEnvironmentStrings("%Sonic2010_ROOT%")
dst = Left(src, 2) & Dest
copyArray = Array(ViewerBin, ViewerDvd, DocumentDesign, Artworks, Dvd, DvdImage, Elf, Plugins, Tools)
copyfileArray = Array(ViewerBat, ElfBat, ElfRBat)

Rem 引数の処理
Dim IsoutPutMessage,param
IsoutPutMessage = false
For Each param In  WScript.Arguments
	If StrComp(param, "Message ") Then
		IsoutPutMessage = true
	End If
Next

Rem メインルーチン
If fileStream.FolderExists(src) = false Then
	WScript.Echo "環境変数Sonic2010_Rootが設定せれていません"
Else
	Call Main()
	WScript.Echo ""
	WScript.Echo dst & "にコピー終了"
End If
Set wshShell = Nothing
Set fileStream = Nothing
Set src = Nothing
Set dst = Nothing
Set copyArray = Nothing
Set copyfileArray = Nothing
Set IsoutPutMessage = Nothing
Set param = Nothing
WScript.Quit 0

Rem メイン関数
Sub Main()
	Dim targetFolder, target
	
	Dim bat,file
	For Each file In copyfileArray
		target = src & file
		Set bat = fileStream.getFile(target)
		CopyFile(bat)
	Next
	
	Dim copyFolder
	For Each copyFolder In copyArray
		target = src & copyFolder
		Set targetFolder = fileStream.getFolder(target)
		Call SearchFileExceptSVN(targetFolder)
		If IsoutPutMessage = true Then
			WScript.Echo target & " コピー終了"
		End If
	Next
End Sub

Rem SVNファイル以外フォルダを再帰的に見てファイルを探す関数関数
Sub SearchFileExceptSVN(ByVal folder)
	
	Rem ファイルをコピーする
	Dim file
	For Each file In folder.Files
		Call CopyFile(file)
	Next
	
	Rem 再帰的に探査する
	Dim subFolder
	For Each subFolder In folder.SubFolders
		If StrComp(subFolder.Name, ".svn") Then
			Call SearchFileExceptSVN(subFolder)
		End If
	Next
	
End Sub

Rem 適切な位置にファイルをコピーする関数
Sub CopyFile(ByVal file)
	Dim outPut,outPutPath, len
	outPut = dst & Mid(file.Path, 3)
	outPutPath = Left(outPut, InStrRev(outPut, "\") - 1)
	
	Rem WScript.Echo outPutPath
	
	Rem フォルダーの作成
	If fileStream.FolderExists(outPutPath) = false Then
		CreateFolder2(outPutPath)
	End If
	
	Rem コピー
	fileStream.CopyFile file.Path, outPut 
End Sub

Rem 親込みでフォルダを生成する
Sub CreateFolder2(ByVal folder)
	Dim parent
	parent = fileStream.GetParentFolderName(folder)
	If fileStream.FolderExists(parent) = false Then
		CreateFolder2(parent)
	End If
	fileStream.CreateFolder(folder)
End Sub
