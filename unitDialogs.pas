unit unitDialogs;

interface
uses
 dialogs, graphics;
 procedure dialColorClock;
 procedure dialColorDate;
 procedure dialColorForm;
 procedure dialColorAlarmFlag;
 procedure dialFontClock;
 procedure dialFontDate;
 procedure dialFontAlarm;

implementation
uses
 unitMain;
////////////////////////////////////////////////////////////////////////////////
procedure dialColorClock;
var
 clockColor : TColor;
begin
 frmMain.dialColor.Color := frmMain.lblHours10.Font.Color;
 frmMain.dialColor.Execute;
 clockColor := frmMain.dialColor.Color;
 frmMain.lblHours10.Font.Color := clockColor;
 frmMain.lblHours01.Font.Color := clockColor;
 frmMain.lblMinutes10.Font.Color := clockColor;
 frmMain.lblMinutes01.Font.Color := clockColor;
 frmMain.lblSeconds10.Font.Color := clockColor;
 frmMain.lblSeconds01.Font.Color := clockColor;
end;
/////////////////////////////
procedure dialColorDate;
begin
 frmMain.dialColor.Color := frmMain.lblDate.Font.Color;
 frmMain.dialColor.Execute;
 frmMain.lblDate.Font.Color := frmMain.dialColor.Color;
end;
/////////////////////////////
procedure dialColorAlarmFlag;
begin
 frmMain.dialColor.Color := frmMain.lblAlarmCountDown.Font.Color;
 frmMain.dialColor.Execute;
 frmMain.lblAlarmCountDown.Font.Color := frmMain.dialColor.Color;
end;
//////////////////////////////
procedure dialColorForm;
begin
 frmMain.dialColor.Color := frmMain.Color;
 frmMain.dialColor.Execute;
 frmMain.Color := frmMain.dialColor.Color;
 frmMain.pnlAlarm.Color := frmMain.dialColor.Color;
 frmMain.lblHours10.Color := frmMain.dialColor.Color;
 frmMain.lblHours01.Color := frmMain.dialColor.Color;
 frmMain.lblMinutes10.Color := frmMain.dialColor.Color;
 frmMain.lblMinutes01.Color := frmMain.dialColor.Color;
 frmMain.lblSeconds10.Color := frmMain.dialColor.Color;
 frmMain.lblSeconds01.Color := frmMain.dialColor.Color;
 frmMain.lblDate.Color := frmMain.dialColor.Color;
end;
/////////////////////////////
procedure dialFontClock;
var
 ClockFont : TFont;
begin
 frmMain.dialFont.Font := frmMain.lblHours10.Font;
 frmMain.dialFont.Execute;
 ClockFont := frmMain.dialFont.Font;
 frmMain.lblHours10.Font := clockFont;
 frmMain.lblHours01.Font := clockFont;
 frmMain.lblMinutes10.Font := clockFont;
 frmMain.lblMinutes01.Font := clockFont;
 frmMain.lblSeconds10.Font := clockFont;
 frmMain.lblSeconds01.Font := clockFont;
end;
/////////////////////////////
procedure dialFontDate;
begin
 frmMain.dialFont.Font := frmMain.lblDate.Font;
 frmMain.dialFont.Execute;
 frmMain.lblDate.Font := frmMain.dialFont.Font;
end;
////////////////////////////////////////////////////////////////////////////////
procedure dialFontAlarm;
begin
  frmMain.dialFont.Font := frmMain.lblAlarm1.Font;
  frmMain.lblAlarmCountDown.Font := frmMain.lblAlarm1.Font;
  frmMain.dialFont.Execute;
  frmMain.lblAlarm1.Font := frmMain.dialFont.Font;
  frmMain.lblAlarm2.Font := frmMain.dialFont.Font;
  frmMain.lblAlarmCountDown.Font := frmMain.dialFont.Font;
end;

////////////////////////////////////////////////////////////////////////////////
end.
