Rem �萔(�����̏������O���ݒ�t�@�C������̓ǂݍ��݂ɂ��ėǂ������E�E�E)
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

Rem ���ϐ��̎擾
Dim fileStream,wshShell,src, dst, copyArray, copyfileArray
Set fileStream = WScript.CreateObject("Scripting.FileSystemObject")
Set wshShell = WScript.CreateObject("WScript.Shell")
src = wshShell.ExpandEnvironmentStrings("%Sonic2010_ROOT%")
dst = Left(src, 2) & Dest
copyArray = Array(ViewerBin, ViewerDvd, DocumentDesign, Artworks, Dvd, DvdImage, Elf, Plugins, Tools)
copyfileArray = Array(ViewerBat, ElfBat, ElfRBat)

Rem �����̏���
Dim IsoutPutMessage,param
IsoutPutMessage = false
For Each param In  WScript.Arguments
	If StrComp(param, "Message ") Then
		IsoutPutMessage = true
	End If
Next

Rem ���C�����[�`��
If fileStream.FolderExists(src) = false Then
	WScript.Echo "���ϐ�Sonic2010_Root���ݒ肹��Ă��܂���"
Else
	Call Main()
	WScript.Echo ""
	WScript.Echo dst & "�ɃR�s�[�I��"
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

Rem ���C���֐�
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
			WScript.Echo target & " �R�s�[�I��"
		End If
	Next
End Sub

Rem SVN�t�@�C���ȊO�t�H���_���ċA�I�Ɍ��ăt�@�C����T���֐��֐�
Sub SearchFileExceptSVN(ByVal folder)
	
	Rem �t�@�C�����R�s�[����
	Dim file
	For Each file In folder.Files
		Call CopyFile(file)
	Next
	
	Rem �ċA�I�ɒT������
	Dim subFolder
	For Each subFolder In folder.SubFolders
		If StrComp(subFolder.Name, ".svn") Then
			Call SearchFileExceptSVN(subFolder)
		End If
	Next
	
End Sub

Rem �K�؂Ȉʒu�Ƀt�@�C�����R�s�[����֐�
Sub CopyFile(ByVal file)
	Dim outPut,outPutPath, len
	outPut = dst & Mid(file.Path, 3)
	outPutPath = Left(outPut, InStrRev(outPut, "\") - 1)
	
	Rem WScript.Echo outPutPath
	
	Rem �t�H���_�[�̍쐬
	If fileStream.FolderExists(outPutPath) = false Then
		CreateFolder2(outPutPath)
	End If
	
	Rem �R�s�[
	fileStream.CopyFile file.Path, outPut 
End Sub

Rem �e���݂Ńt�H���_�𐶐�����
Sub CreateFolder2(ByVal folder)
	Dim parent
	parent = fileStream.GetParentFolderName(folder)
	If fileStream.FolderExists(parent) = false Then
		CreateFolder2(parent)
	End If
	fileStream.CreateFolder(folder)
End Sub
