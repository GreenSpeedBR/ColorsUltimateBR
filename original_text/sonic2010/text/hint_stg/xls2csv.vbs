'WSHスクリプト xls から csv ファイルを作成
'2006.08.25 久米三喜夫



' ***** 変数 *****



Dim SysFile     'ファイルシステム
Dim SysShell    'wshシェル
Dim AppExcel    '作業用Excel
Dim BoolVisible '可視化 True:する / False:しない
Dim StrPathXls  '元のxlsファイル
Dim StrBaseName 'xls ファイル名の拡張子抜き
Dim StrFileName 'xls ファイル名



' ***** 処理本体 *****



BoolVisible = False

'Excel 全終了
Call CloseAllExcel()

'セットアップ
Set SysFile  = CreateObject("Scripting.FileSystemObject")
Set SysShell = CreateObject("WScript.Shell")
Set AppExcel = CreateObject("Excel.Application")
SysShell.CurrentDirectory = SysFile.GetParentFolderName(WScript.ScriptFullName)
AppExcel.Application.Visible = BoolVisible

'各種変数設定
StrPathXls  = SysFile.GetAbsolutePathName( WScript.Arguments.Item(0) )
StrFileName = SysFile.GetFileName(StrPathXls)
StrBaseName = SysFile.GetBaseName(StrPathXls)

'処理本体
Call Xls2Csv("jpn","Japanese")
Call Xls2Csv("eng","English")
Call Xls2Csv("fr","French")
Call Xls2Csv("es","Spanish")
Call Xls2Csv("it","Italian")
Call Xls2Csv("de","German")
'後始末
AppExcel.Application.Quit



' ***** サブルーチン *****



'現在起動している全ての Excel を終了する
'(注意)プロセスを終了してしまうので 編集中の内容は保存されない
Sub CloseAllExcel()
    Dim wbemServices
    Dim wbemObjectSet
    Dim count '起動している EXCEL の数
    
    Set wbemServices = GetObject("winmgmts:\\" & ".")
    Set wbemObjectSet = wbemServices.InstancesOf("Win32_Process")
    
    '削除前の警告
    count = 0
    For Each wbemObject In wbemObjectSet
        If wbemObject.Name = "EXCEL.EXE" Then
            count = count + 1
        End If
    Next
    If count > 0 Then
        MsgBox "Excelを全て終了します。編集中のドキュメントは保存してください。"
    End If
    
    '削除本体
    For Each wbemObject In wbemObjectSet
        If wbemObject.Name = "EXCEL.EXE" Then
            wbemObject.Terminate()
        End If
    Next
End Sub


' .xls の指定の言語シートから .csv ファイルを作成する
'引数 StrSeet シート名
Sub Xls2Csv(StrSeet,StrDir)
    Dim StrBaseNameDst
    
    'StrBaseNameDst = StrBaseName & "_" & StrSeet
    StrBaseNameDst = StrBaseName

    '.csv ファイル作成
    AppExcel.Application.Workbooks.Open(StrPathXls)
    AppExcel.Application.Workbooks(StrFileName).Worksheets(StrSeet).Activate
    AppExcel.Application.Workbooks(StrFileName).SaveAs SysFile.GetParentFolderName(StrPathXls) & "\" & StrDir & "\" & StrBaseNameDst & ".csv",  -4158
    AppExcel.ActiveWorkbook.Close False
End Sub


