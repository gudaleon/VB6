VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "HspfFtable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
'Copyright 2002 AQUA TERRA Consultants - Royalty-free use permitted under open source license

Dim pId As Long
Dim pNrows As Long
Dim pNcols As Long
Dim pDepth() As Double
Dim pArea() As Double
Dim pVolume() As Double
Dim pOutflow1() As Double  'redim preserve does not work
Dim pOutflow2() As Double  'with multiple subscripts
Dim pOutflow3() As Double
Dim pOutflow4() As Double
Dim pOutflow5() As Double
Dim pDepthAsRead() As String
Dim pAreaAsRead() As String
Dim pVolumeAsRead() As String
Dim pOutflow1AsRead() As String
Dim pOutflow2AsRead() As String
Dim pOutflow3AsRead() As String
Dim pOutflow4AsRead() As String
Dim pOutflow5AsRead() As String
Dim pOperation As HspfOperation
Dim pComment As String

Public Property Get Depth(row&) As Double
  Depth = pDepth(row)
End Property
Public Property Let Depth(row&, newDepth#)
  pDepth(row) = newDepth
End Property

Public Property Get Area(row&) As Double
  Area = pArea(row)
End Property
Public Property Let Area(row&, newArea#)
  pArea(row) = newArea
End Property

Public Property Get Volume(row&) As Double
  Volume = pVolume(row)
End Property
Public Property Let Volume(row&, newVolume#)
  pVolume(row) = newVolume
End Property

Public Property Get Outflow1(row&) As Double
  Outflow1 = pOutflow1(row)
End Property
Public Property Let Outflow1(row&, newOutflow#)
  pOutflow1(row) = newOutflow
End Property

Public Property Get Outflow2(row&) As Double
  Outflow2 = pOutflow2(row)
End Property
Public Property Let Outflow2(row&, newOutflow#)
  pOutflow2(row) = newOutflow
End Property

Public Property Get Outflow3(row&) As Double
  Outflow3 = pOutflow3(row)
End Property
Public Property Let Outflow3(row&, newOutflow#)
  pOutflow3(row) = newOutflow
End Property

Public Property Get Outflow4(row&) As Double
  Outflow4 = pOutflow4(row)
End Property
Public Property Let Outflow4(row&, newOutflow#)
  pOutflow4(row) = newOutflow
End Property

Public Property Get Outflow5(row&) As Double
  Outflow5 = pOutflow5(row)
End Property
Public Property Let Outflow5(row&, newOutflow#)
  pOutflow5(row) = newOutflow
End Property

Public Property Get DepthAsRead(row&) As String
  DepthAsRead = pDepthAsRead(row)
End Property
Public Property Let DepthAsRead(row&, newDepth$)
  pDepthAsRead(row) = newDepth
End Property

Public Property Get AreaAsRead(row&) As String
  AreaAsRead = pAreaAsRead(row)
End Property
Public Property Let AreaAsRead(row&, newArea$)
  pAreaAsRead(row) = newArea
End Property

Public Property Get VolumeAsRead(row&) As String
  VolumeAsRead = pVolumeAsRead(row)
End Property
Public Property Let VolumeAsRead(row&, newVolume$)
  pVolumeAsRead(row) = newVolume
End Property

Public Property Get Outflow1AsRead(row&) As String
  Outflow1AsRead = pOutflow1AsRead(row)
End Property
Public Property Let Outflow1AsRead(row&, newOutflowAsRead$)
  pOutflow1AsRead(row) = newOutflowAsRead
End Property

Public Property Get Outflow2AsRead(row&) As String
  Outflow2AsRead = pOutflow2AsRead(row)
End Property
Public Property Let Outflow2AsRead(row&, newOutflowAsRead$)
  pOutflow2AsRead(row) = newOutflowAsRead
End Property

Public Property Get Outflow3AsRead(row&) As String
  Outflow3AsRead = pOutflow3AsRead(row)
End Property
Public Property Let Outflow3AsRead(row&, newOutflowAsRead$)
  pOutflow3AsRead(row) = newOutflowAsRead
End Property

Public Property Get Outflow4AsRead(row&) As String
  Outflow4AsRead = pOutflow4AsRead(row)
End Property
Public Property Let Outflow4AsRead(row&, newOutflowAsRead$)
  pOutflow4AsRead(row) = newOutflowAsRead
End Property

Public Property Get Outflow5AsRead(row&) As String
  Outflow5AsRead = pOutflow5AsRead(row)
End Property
Public Property Let Outflow5AsRead(row&, newOutflowAsRead$)
  pOutflow5AsRead(row) = newOutflowAsRead
End Property

Public Property Get Comment() As String
  Comment = pComment
End Property
Public Property Let Comment(newcomment$)
  pComment = newcomment
End Property

Public Sub Edited()
   pOperation.Edited = True
End Sub

Public Property Get Id() As Long
  Id = pId
End Property
Public Property Let Id(newId As Long)
  pId = newId
End Property

Public Property Get Nrows() As Long
  Nrows = pNrows
End Property
Public Property Let Nrows(newNrows As Long)
  pNrows = newNrows
  Call initArrays
End Property

Public Property Get Ncols() As Long
  Ncols = pNcols
End Property
Public Property Let Ncols(newNcols As Long)
  pNcols = newNcols
  Call initArrays
End Property

Private Sub initArrays()
  If pNrows > 0 And pNcols > 0 Then 'ok to do this
    ReDim Preserve pDepth(pNrows)
    ReDim Preserve pArea(pNrows)
    ReDim Preserve pVolume(pNrows)
    ReDim Preserve pOutflow1(pNrows)
    ReDim Preserve pOutflow2(pNrows)
    ReDim Preserve pOutflow3(pNrows)
    ReDim Preserve pOutflow4(pNrows)
    ReDim Preserve pOutflow5(pNrows)
    ReDim Preserve pDepthAsRead(pNrows)
    ReDim Preserve pAreaAsRead(pNrows)
    ReDim Preserve pVolumeAsRead(pNrows)
    ReDim Preserve pOutflow1AsRead(pNrows)
    ReDim Preserve pOutflow2AsRead(pNrows)
    ReDim Preserve pOutflow3AsRead(pNrows)
    ReDim Preserve pOutflow4AsRead(pNrows)
    ReDim Preserve pOutflow5AsRead(pNrows)
  End If
End Sub
Public Property Get Operation() As HspfOperation
  Set Operation = pOperation
End Property
Public Property Set Operation(newOperation As HspfOperation)
  Set pOperation = newOperation
End Property

'Public Sub ReadUciFile()
'  Dim init&, OmCode&, retkey&, cbuff$, retcod&
'  Dim done As Boolean
'  Dim i&, j&
'
'  OmCode = HspfOmCode("FTABLES")
'  init = 1
'  done = False
'  Do Until done
'    Call REM_XBLOCK(Me.Operation.Uci, OmCode, init, retkey, cbuff, retcod)
'    init = 0
'    If InStr(cbuff, "FTABLE") > 0 Then 'is this the one
'      If Right(cbuff, 3) = pId Then 'it is
'        Call REM_XBLOCK(Me.Operation.Uci, OmCode, init, retkey, cbuff, retcod)
'        Nrows = Left(cbuff, 5)
'        Ncols = Mid(cbuff, 6, 5)
'        For i = 1 To pNrows
'          Call REM_XBLOCK(Me.Operation.Uci, OmCode, init, retkey, cbuff, retcod)
'          pDepth(i) = Left(cbuff, 10)
'          pArea(i) = Mid(cbuff, 11, 10)
'          pVolume(i) = Mid(cbuff, 21, 10)
'          j = Ncols - 3
'          If j > 0 Then
'            pOutflow1(i) = Mid(cbuff, 31, 10)
'          End If
'          If j > 1 Then
'            pOutflow2(i) = Mid(cbuff, 41, 10)
'          End If
'          If j > 2 Then
'            pOutflow3(i) = Mid(cbuff, 51, 10)
'          End If
'          If j > 3 Then
'            pOutflow4(i) = Mid(cbuff, 61, 10)
'          End If
'          If j > 4 Then
'            pOutflow5(i) = Mid(cbuff, 71, 10)
'          End If
'        Next i
'        done = True
'      End If
'    End If
'  Loop
'
'End Sub

Public Sub WriteUciFile(f As Long)
  Dim vOpn As Variant, lOpn As HspfOperation
  Dim i&, j&, s$, t$, fmt$
  
  fmt = "0.##"
  Print #f, " "
  Print #f, "FTABLES"
  For Each vOpn In pOperation.OpnBlk.Ids
    Set lOpn = vOpn
    Print #f, " "
    Print #f, "  FTABLE    " & myFormatI(lOpn.FTable.Id, 3)
    With lOpn.FTable
      Print #f, " rows cols" & Space((.Ncols - 1) * 10) & " ***"
      Print #f, myFormatI(lOpn.FTable.Nrows, 5) & myFormatI(lOpn.FTable.Ncols, 5)
      If Len(.Comment) > 0 Then
        Print #f, .Comment
      Else
        s = "     depth      area    volume"
        For j = 1 To .Ncols - 3
          s = s & "  outflow" & j
        Next j
        Print #f, s & " ***"
      End If
      For i = 1 To .Nrows
        s = Space(10)
        If NumericallyTheSame(.DepthAsRead(i), .Depth(i)) Then
          s = .DepthAsRead(i)
        Else
          RSet s = CStr(Format(.Depth(i), fmt))
        End If
        t = Space(10)
        If NumericallyTheSame(.AreaAsRead(i), .Area(i)) Then
          t = .AreaAsRead(i)
        Else
          RSet t = CStr(Format(.Area(i), fmt))
        End If
        s = s & t
        t = Space(10)
        If NumericallyTheSame(.VolumeAsRead(i), .Volume(i)) Then
          t = .VolumeAsRead(i)
        Else
          RSet t = CStr(Format(.Volume(i), fmt))
        End If
        s = s & t
        For j = 1 To .Ncols - 3
          t = Space(10)
          If j = 1 Then
            If NumericallyTheSame(.Outflow1AsRead(i), .Outflow1(i)) Then
              t = .Outflow1AsRead(i)
            Else
              RSet t = CStr(Format(.Outflow1(i), fmt))
            End If
          End If
          If j = 2 Then
            If NumericallyTheSame(.Outflow2AsRead(i), .Outflow2(i)) Then
              t = .Outflow2AsRead(i)
            Else
              RSet t = CStr(Format(.Outflow2(i), fmt))
            End If
          End If
          If j = 3 Then
            If NumericallyTheSame(.Outflow3AsRead(i), .Outflow3(i)) Then
              t = .Outflow3AsRead(i)
            Else
              RSet t = CStr(Format(.Outflow3(i), fmt))
            End If
          End If
          If j = 4 Then
            If NumericallyTheSame(.Outflow4AsRead(i), .Outflow4(i)) Then
              t = .Outflow4AsRead(i)
            Else
              RSet t = CStr(Format(.Outflow4(i), fmt))
            End If
          End If
          If j = 5 Then
            If NumericallyTheSame(.Outflow5AsRead(i), .Outflow5(i)) Then
              t = .Outflow5AsRead(i)
            Else
              RSet t = CStr(Format(.Outflow5(i), fmt))
            End If
          End If
          s = s & t
        Next j
        Print #f, s
      Next i
    End With
    Print #f, "  END FTABLE" & myFormatI(lOpn.FTable.Id, 3)
  Next vOpn
  Print #f, "END FTABLES"
End Sub

Public Sub Edit()
  editInit Me, Me.Operation.OpnBlk.Uci.icon
End Sub

Public Property Get EditControlName() As String
  EditControlName = "ATCoHspf.ctlFTableEdit"
End Property

Public Property Get Caption() As String
  Caption = "Ftable"
End Property

Private Sub Class_Initialize()
  Nrows = 1
  Ncols = 4
  pDepth(1) = 0
  pArea(1) = 0
  pVolume(1) = 0
  pOutflow1(1) = 0
  pOutflow2(1) = 0
  pOutflow3(1) = 0
  pOutflow4(1) = 0
  pOutflow5(1) = 0
End Sub


'Public Sub FTableFromCrossSect(length!, elup!, eldown!, w1!, w2!, h!, sfp!, nch!, nfp!)
'
'  'from xsect, replaced by algorithm from tt
'  'LENGTH - reach length (miles)
'  'ELUP   - upstream elevation (ft)
'  'ELDOWN - downstream elevation (ft)
'  'W1     - channel bottom width (ft)
'  'W2     - channel bankfull width (ft)
'  'H      - channel height (ft)
'  'SFP    - slope of flood plain (-)
'  'NCH    - mannings n for the channel
'  'NFP    - mannings n for the flood plain
'
'  Dim i1&, i2&, i3&, i&
'  Dim slope!, theta1!, wp1!
'  Dim theta2!, wp2!, inc1!, inc2!, inc3!, tw!, area!, wetp!, hydrad!
'  Dim areain!, wetpin!
'  Dim depth!(15), sfarea!(15), volume!(15), disch!(15), flotim!(15)
'
'  'INTRINSIC   ABS,ATAN,COS,SIN
'
'  slope = Abs(elup - eldown) / (length * 5280#)
'  theta1 = Atn((w2 - w1) / (2# * h))
'  wp1 = Cos(theta1)
'  theta2 = Atn(sfp)
'  wp2 = Sin(theta2)
'
'  inc1 = h / 12#
'
'  depth(1) = 0#
'  sfarea(1) = 0#
'  volume(1) = 0#
'  disch(1) = 0#
'  flotim(1) = 0#
'
'  'main channel computations
'  For i1 = 2 To 7
'    depth(i1) = (i1 - 1) * inc1
'    tw = w1 + ((w2 - w1) / h) * depth(i1)
'    sfarea(i1) = tw * length * 5280# / 43560#
'    area = ((tw + w1) / 2) * depth(i1)
'    volume(i1) = area * length * 5280# / 43560#
'    wetp = w1 + 2 * (depth(i1) / wp1)
'    hydrad = area / wetp
'    disch(i1) = 1.49 * area * (hydrad ^ 0.667) * (slope ^ 0.5) / nch
'    flotim(i1) = (volume(i1) * 43560#) / (disch(i1) * 60#)
'  Next i1
'
'  inc2 = 2# * inc1
'  For i2 = 8 To 10
'    depth(i2) = 6 * inc1 + (i2 - 7) * inc2
'    tw = w1 + ((w2 - w1) / h) * depth(i2)
'    sfarea(i2) = tw * length * 5280# / 43560#
'    area = ((tw + w1) / 2) * depth(i2)
'    volume(i2) = area * length * 5280# / 43560#
'    wetp = w1 + 2 * (depth(i2) / wp1)
'    hydrad = area / wetp
'    disch(i2) = 1.49 * area * (hydrad ^ 0.667) * (slope ^ 0.5) / nch
'    flotim(i2) = (volume(i2) * 43560#) / (disch(i2) * 60#)
'  Next i2
'
'  'overbank computations
'  areain = ((w1 + w2) / 2) * h
'  wetpin = w1 + 2 * (h / wp1)
'  'inc3 = 6# * inc2  '(CHANGED 2 TO 6 1/2/90 FOR CHES BAY WORK)
'  inc3 = 2# * inc2
'  For i3 = 11 To 15
'    depth(i3) = 6 * inc1 + 3 * inc2 + (i3 - 10) * inc3
'    tw = w2 + 2 * (depth(i3) - h) / sfp
'    sfarea(i3) = tw * length * 5280# / 43560#
'    'incised channel
'    area = areain + w2 * (depth(i3) - h)
'    volume(i3) = area * length * 5280# / 43560#
'    hydrad = area / wetpin
'    disch(i3) = 1.49 * area * (hydrad ^ 0.667) * (slope ^ 0.5) / nch
'    'overbank
'    area = (depth(i3) - h) * (depth(i3) - h) / sfp
'    volume(i3) = volume(i3) + area * length * 5280# / 43560#
'    wetp = 2 * (depth(i3) - h) / wp2
'    hydrad = area / wetp
'    disch(i3) = disch(i3) + 1.49 * area * (hydrad ^ 0.667) * (slope ^ 0.5) / nfp
'    flotim(i3) = (volume(i3) * 43560#) / (disch(i3) * 60#)
'  Next i3
'
'  Nrows = 15
'  Ncols = 4
'  For i = 1 To Nrows
'    pDepth(i) = depth(i)
'    pArea(i) = sfarea(i)
'    pVolume(i) = volume(i)
'    pOutflow(i, 1) = disch(i)
'  Next i
'
'End Sub

Public Sub FTableFromCrossSect(dL!, dYm!, dWm!, dN!, dS!, dM11!, dM12!, dYc!, dM21!, dM22!, _
                               dYt1!, dYt2!, dM31!, dM32!, dW11!, dW12!)
  
  'algorithm from tt
  Dim Depth!(8), sfarea!(8), Volume!(8), disch!(8), i&
  Dim NearestBase!, CrossSectionArea!, HydraulicRadius!
  Dim dArea!, dDepth!, dDenominator!, lp!, rp!
  Dim dWb!, dWc!, dWt1!, dWt2!
  
  On Error GoTo errorhandler
  'initialize parameters
  If (dYm < dYc) Then
    dWb = dWm - (dYm / dM11) - (dYm / dM12)
  End If
  If (dYm > dYc And dYm < dYt1) Then
    dWb = dWm - dW11 - dW12 - ((dYm - dYc) / dM21) - ((dYm - dYc) / dM22) - (dYc / dM11) - (dYc / dM12)
  End If
  If (dYm > dYt1 And dYm < dYt2) Then
    dWb = dWm - ((dYm - dYt1) / dM31) - ((dYm - dYt1) / dM32) - dW11 - dW12 - ((dYt1 - dYc) / dM21) - ((dYt1 - dYc) / dM22) - (dYc / dM11) - (dYc / dM12)
  End If
  If dWb < 0 Then
    dWb = 0.0001
  End If
  If (dYm > dYt2) Then
    'should not happen
    dYm = -999
  End If
  dWc = dWb + (dYc / dM11) + (dYc / dM12)
  dWt1 = dWc + dW11 + dW12 + ((dYt1 - dYc) / dM21) + ((dYt1 - dYc) / dM22)
  dWt2 = dWt1 + ((dYt2 - dYt1) / dM31) + ((dYt2 - dYt1) / dM32)
  
  If dYm < 0# Or dWm < 0# Or dN < 0# Or dS < 0# Or dM11 < 0# _
    Or dM12 < 0# Or dM21 < 0# Or dM22 < 0# Or dM31 < 0# Or dM32 < 0# Then
    Nrows = 1
    Ncols = 4
    pDepth(1) = 0
    pArea(1) = 0
    pVolume(1) = 0
    pOutflow1(1) = 0
  Else
    'calculate for eight depths
    Depth(1) = 0#
    Depth(2) = dYm / 10#
    Depth(3) = dYm
    Depth(4) = dYc
    Depth(5) = (dYc + dYt1) / 2#
    Depth(6) = dYt1
    Depth(7) = (dYt1 + dYt2) / 2#
    Depth(8) = dYt2
    Nrows = 8
    For i = 1 To Nrows
    
      'get nearest base
      If (Depth(i) > dYt1) Then
        NearestBase = dWt1
      ElseIf (Depth(i) > dYc) Then
        NearestBase = dWc + dW11 + dW12
      'ElseIf (Depth(i) = dYc) Then
      '  NearestBase = dWc    pbd - should still be bottom channel width
      Else
        NearestBase = dWb
      End If
      
      'get cross section area
      If dYc > Depth(i) Then
        dDepth = Depth(i)
      Else
        dDepth = dYc
      End If
      lp = LeftPiece(dDepth, dYt1, dM32, dYc, dM22, dM12)
      rp = RightPiece(dDepth, dYt1, dM31, dYc, dM21, dM11)
      CrossSectionArea = dDepth * (dWb + (lp * 0.5) + (rp * 0.5))
      If (Depth(i) > dYc) Then
        If dYt1 > Depth(i) Then
          dDepth = Depth(i)
        Else
          dDepth = dYt1
        End If
        lp = LeftPiece(dDepth, dYt1, dM32, dYc, dM22, dM12)
        rp = RightPiece(dDepth, dYt1, dM31, dYc, dM21, dM11)
        CrossSectionArea = CrossSectionArea + (dDepth - dYc) * (dWc + dW11 + dW12 + (lp * 0.5) + (rp * 0.5))
      End If
      If (Depth(i) > dYt1) Then
        If dYt2 > Depth(i) Then
          dDepth = Depth(i)
        Else
          dDepth = dYt2
        End If
        lp = LeftPiece(dDepth, dYt1, dM32, dYc, dM22, dM12)
        rp = RightPiece(dDepth, dYt1, dM31, dYc, dM21, dM11)
        CrossSectionArea = CrossSectionArea + (dDepth - dYt1) * (dWt1 + (lp * 0.5) + (rp * 0.5))
      End If
      
      'get hydraulic radius
      dDenominator = dWb
      If dYc > Depth(i) Then
        dDepth = Depth(i)
      Else
        dDepth = dYc
      End If
      dDenominator = dDenominator + dDepth * (Sqr(1# + 1# / (dM11 * dM11)) + Sqr(1# + 1# / (dM12 * dM12)))
      If (Depth(i) > dYc) Then
        If dYt1 > Depth(i) Then
          dDepth = Depth(i)
        Else
          dDepth = dYt1
        End If
        dDenominator = dDenominator + dW11 + dW12 + (dDepth - dYc) * (Sqr(1# + 1# / (dM21 * dM21)) + Sqr(1# + 1# / (dM22 * dM22)))
      End If
      If (Depth(i) > dYt1) Then
        If dYt2 > Depth(i) Then
          dDepth = Depth(i)
        Else
          dDepth = dYt2
        End If
        dDenominator = dDenominator + (dDepth - dYt1) * (Sqr(1# + 1# / (dM31 * dM31)) + Sqr(1# + 1# / (dM32 * dM32)))
      End If
      HydraulicRadius = CrossSectionArea / dDenominator

      lp = LeftPiece(Depth(i), dYt1, dM32, dYc, dM22, dM12)
      rp = RightPiece(Depth(i), dYt1, dM31, dYc, dM21, dM11)
      
      sfarea(i) = dL * (NearestBase + lp + rp) / 43560#
      Volume(i) = dL * CrossSectionArea / 43560#
      'disch(i) = 1.49 / dN * pow(HydraulicRadius, 2# / 3#) * Sqr(dS) * CrossSectionArea
      disch(i) = 1.49 / dN * (HydraulicRadius ^ (2 / 3)) * Sqr(dS) * CrossSectionArea
    Next i

    'build ftable
    Nrows = 8
    Ncols = 4
    For i = 1 To Nrows
      pDepth(i) = Depth(i)
      pArea(i) = sfarea(i)
      pVolume(i) = Volume(i)
      pOutflow1(i) = disch(i)
    Next i
  End If
  On Error Resume Next
  Exit Sub
errorhandler:
  myMsgBox.Show "An error occurred while building this FTable.", "FTable Problem", "+-&Close"
  On Error Resume Next
End Sub

Private Function LeftPiece(Depth!, dYt1!, dM32!, dYc!, dM22!, dM12!)
  'get left piece
  If (Depth > dYt1) Then
    LeftPiece = (Depth - dYt1) / dM32
  ElseIf (Depth > dYc) Then
    LeftPiece = (Depth - dYc) / dM22
  Else
    LeftPiece = Depth / dM12
  End If
End Function
      
Private Function RightPiece(Depth!, dYt1!, dM31!, dYc!, dM21!, dM11!)
  'get right piece
  If (Depth > dYt1) Then
    RightPiece = (Depth - dYt1) / dM31
  ElseIf (Depth > dYc) Then
    RightPiece = (Depth - dYc) / dM21
  Else
    RightPiece = Depth / dM11
  End If
End Function
      
'bool CPTFData:: DataValid (void)
'{
'    double dAcRc;       // CrossSectionArea (Yc)                * HydraulicRadius (Yc)
'    double dAct1Rct1;   // CrossSectionArea ((Yc + Yt1) / 2)    * HydraulicRadius ((Yc + Yt1) / 2)
'    double dAt1Rt1;     // CrossSectionArea (Yt1)               * HydraulicRadius (Yt1)
'    double dAt1t2Rt1t2; // CrossSectionArea ((Yt1 + Yt2) / 2)   * HydraulicRadius ((Yt1 + Yt2) / 2)
'
'
'
'    dAcRc       = GetCrossSectionArea (m_dYc)                   * pow (GetHydraulicRadius (m_dYc),                      2.0 / 3.0);
'    dAct1Rct1   = GetCrossSectionArea ((m_dYc + m_dYt1)  / 2.0) * pow (GetHydraulicRadius ((m_dYc + m_dYt1)  / 2.0),    2.0 / 3.0);
'    dAt1Rt1     = GetCrossSectionArea (m_dYt1)                  * pow (GetHydraulicRadius (m_dYt1),                     2.0 / 3.0);
'    dAt1t2Rt1t2 = GetCrossSectionArea ((m_dYt1 + m_dYt2) / 2.0) * pow (GetHydraulicRadius ((m_dYt1 + m_dYt2)  / 2.0),   2.0 / 3.0);
'
'    return ((((1.1 * dAcRc) - dAct1Rct1) < 0.0) && (((1.1 * dAt1Rt1) - dAt1t2Rt1t2) < 0.0));
'}

Private Function NumericallyTheSame(ValueAsRead$, ValueStored!) As Boolean
  'see if the current ftable value is the same as the value as read from the uci
  '4. is the same as 4.0
  Dim rtemp1!
  
  NumericallyTheSame = False
  If IsNumeric(ValueStored) Then
    If IsNumeric(ValueAsRead) Then
      'simple case
      rtemp1 = ValueAsRead
      If rtemp1 = ValueStored Then
        NumericallyTheSame = True
      End If
    End If
  End If
End Function


