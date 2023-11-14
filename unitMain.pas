unit unitMain;

interface

uses
  Windows, Messages,  Variants,  Controls, Forms, System.SysUtils, ExtCtrls, StdCtrls,
  ActnList, Menus, Dialogs, Classes, graphics, Registry, FmPosIni, mpcUserName,
  unitDialogs, ComCtrls, System.Actions,MMDevAPI,shellAPI,activex,
  Vcl.WinXPickers, Vcl.Mask, Vcl.NumberBox;

type
  TfrmMain = class(TForm)
    lblHours10: TLabel;
    Timer1: TTimer;
    lblMinutes10: TLabel;
    lblSeconds10: TLabel;
    lblDate: TLabel;
    lblHours01: TLabel;
    lblMinutes01: TLabel;
    lblSeconds01: TLabel;
    popupMainForm: TPopupMenu;
    popupClockColor: TMenuItem;
    actListColor: TActionList;
    actClockColor: TAction;
    dialColor: TColorDialog;
    actDateColor: TAction;
    popupDateColor: TMenuItem;
    actFormColor: TAction;
    popupFormColor: TMenuItem;
    dialFont: TFontDialog;
    popupClockFont: TMenuItem;
    actClockFont: TAction;
    actDateFont: TAction;
    popupDateFont: TMenuItem;
    actStayOnTop: TAction;
    StayonTop1: TMenuItem;
    Mode1: TMenuItem;
    Clock1: TMenuItem;
    CountDown1: TMenuItem;
    CountUp1: TMenuItem;
    ActClock: TAction;
    actCountDown: TAction;
    actCountUp: TAction;
    dtpickerOffSet: TDateTimePicker;
    btnGo: TButton;
    btnCancel: TButton;
    pnlAlarm: TPanel;
    dtpickerAlarm: TDateTimePicker;
    btnAlarmOff: TButton;
    Alarm1: TMenuItem;
    actAlarmOff: TAction;
    frmMainPos: TMPCFormPosSave;
    actAlarmOn: TAction;
    actAlarmPanelVisible: TAction;
    btnAlarmOn: TButton;
    actSnooze: TAction;
    lblAlarm1: TLabel;
    PopupAlarmFont: TMenuItem;
    actAlarmFont: TAction;
    lblAlarm2: TLabel;
    timerScreenSaver: TTimer;
    lblAlarmCountDown: TLabel;
    actTimeToAlarm: TAction;
    btnSnooze: TButton;
    btnEndOfDay: TButton;
    btnStartDay: TButton;
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    actAbout: TAction;
    miAbout: TMenuItem;
    miAlarmSetup: TMenuItem;
    pnlAlarmSetup: TPanel;
    lblAlarmSetup: TLabel;
    actAlarmSetup: TAction;
    tpStartDay: TTimePicker;
    tpEndDay: TTimePicker;
    tpSnoozeTime: TTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnAlarmSetupSave: TButton;
    btnAlarmSetupCancel: TButton;
    actAlarmSetupSave: TAction;
    actAlarmSetupCancel: TAction;
    tpAddedTime: TTimePicker;
    Label5: TLabel;
    btnAddedTime: TButton;
    Label4: TLabel;
    nbSnoozesAllowed: TNumberBox;
    procedure actClockColorExecute(Sender: TObject);
    procedure actAlarmOffExecute(Sender: TObject);
    procedure actAlarmOnExecute(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure actCountUpExecute(Sender: TObject);
    procedure actCountDownExecute(Sender: TObject);
    procedure actClockExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDateColorExecute(Sender: TObject);
    procedure actFormColorExecute(Sender: TObject);
    procedure actClockFontExecute(Sender: TObject);
    procedure actDateFontExecute(Sender: TObject);
    procedure actStayOnTopExecute(Sender: TObject);
    procedure alarmTime(Sender: TObject);
    procedure actAlarmPanelVisibleExecute(Sender: TObject);
    procedure actAlarmSnoozeExecute(Sender: TObject);
    procedure actAlarmFontExecute(Sender: TObject);
    procedure timerScreenSaverTimer(Sender: TObject);
    procedure frmMainPosReadIni(var Left, Top, Width, Height: Integer; var WindowState: TWindowState);
    procedure btnEndOfDayClick(Sender: TObject);
    procedure btnStartDayClick(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actAlarmSetupExecute(Sender: TObject);
    procedure actAlarmSetupSaveExecute(Sender: TObject);
    procedure actAlarmSetupCancelExecute(Sender: TObject);
    procedure btnAddedTimeClick(Sender: TObject);
    function mpcTruncateTime(dtTime : TDateTime; bSecondsIs0 : boolean) : TTime;

  private
    { Private declarations }
    procedure JiggleMouse;
    procedure getOriginalVolume;
    procedure setOriginalVolume;
    procedure setAlarmVolume;

  public
    { Public declarations }
    endpointVolume: IAudioEndpointVolume;

  end;

var
  frmMain: TfrmMain;
  Hours10, Hours01, Minutes10, Minutes01, Seconds10, Seconds01, sDate,sCurrentTime : string;
  CustomColorsTime, CustomColorsDate, CustomColorsForm : Tstrings;
  dtTimeOffset, dtAlarmTime : TDateTime;
  bAlarmSet : boolean;
  ifrmMainWidth : Integer = 1119;
  fsFormat : TFormatSettings;
  iSnoozeCountsRemaining : integer;
  iSnoozeMinutes : integer;
  singleAlarmVolumeLevel: Single = 0.99;
  singleBeginningVolumeLevel : Single = 33;
  bOriginalMute : boolean = False;


implementation
uses
  mpcAbout;


{$R *.dfm}



procedure TfrmMain.FormCreate(Sender: TObject);
  var
  deviceEnumerator: IMMDeviceEnumerator;
  defaultDevice: IMMDevice;
  reg : Tregistry;
begin
//about box stuff
  sAppVersion := '3.2.6';
  sDelphiVersion := '11.3 Alexandria';
  sAboutBuildDate := '10/9/2023';

// Registry Stuff
  // Write the Start Time to the registry
  reg := TRegIniFile.Create('software\mpc\clock\AlarmSetup');

  if  not reg.ValueExists('StartTime') then
    reg.WriteTime('StartTime', mpcTruncateTime(tpStartDay.Time,True));
  if  not reg.ValueExists('EndTime') then
    reg.WriteTime('EndTime',mpcTruncateTime(tpEndDay.Time,True));
  if  not reg.ValueExists('SnoozeTime') then
    reg.WriteTime('SnoozeTime', mpcTruncateTime(tpSnoozeTime.Time, true));
  if  not reg.ValueExists('AddedTime') then
    reg.WriteTime('AddedTime', tpAddedTime.Time);
  if  not reg.ValueExists('SnoozesAllowed') then
  begin
    reg.WriteInteger('SnoozesAllowed',nbSnoozesAllowed.ValueInt);
  end;
    nbSnoozesAllowed.ValueInt := reg.ReadInteger('SnoozesAllowed');
    iSnoozeCountsRemaining :=  nbSnoozesAllowed.ValueInt + 1;

    tpStartDay.Time := reg.ReadTime('StartTime');
    btnStartDay.Caption := Copy(TimeToStr(tpStartDay.Time),1,5);
    tpEndDay.Time := reg.ReadTime('EndTime');
    btnEndOfDay.Caption := Copy(TimeToStr(tpEndDay.Time),1,5);
    tpSnoozeTime.Time := reg.ReadTime('SnoozeTime');
    btnSnooze.Caption := IntToStr(iSnoozeCountsRemaining - 1) + ' Snoozes left';
    tpAddedTime.Time := reg.ReadTime('AddedTime');
    btnAddedTime.Caption := Copy(TimeToStr(tpAddedTime.Time),1,4) + ' add to now';
  reg.Free;
//volume stuff
  EndpointVolume:=nil;
  CoCreateInstance(CLASS_IMMDeviceEnumerator, nil, CLSCTX_INPROC_SERVER, IID_IMMDeviceEnumerator, deviceEnumerator);
  deviceEnumerator.GetDefaultAudioEndpoint(eRender, eConsole, defaultDevice);
  defaultDevice.Activate(IID_IAudioEndpointVolume, CLSCTX_INPROC_SERVER, nil, endpointVolume);
//end volume stuff

 fsFormat := TFormatSettings.Create; // Load system defaults
 fsFormat.ShortDateFormat := 'dddd, mmmm d, yyyy';
 fsFormat.LongTimeFormat := 'HH:mm:ss';
 actStayOnTop.Checked := (frmMain.FormStyle = fsStayOnTop);
 bAlarmSet := False;
 ifrmMainWidth := 1119;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.frmMainPosReadIni(var Left, Top, Width, Height: Integer;
  var WindowState: TWindowState);
begin

end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.Timer1Timer(Sender: TObject);
const
 dOneSecond : double = 1/86400;
var
 dtCurrentTime, dtNowTime:TDateTime;
 iAlarmCorrection : double;
 sTimeToAlarm : string;
begin
 dtCurrentTime := now();
 sCurrentTime := formatdatetime('hh:nn:ss',dtCurrentTime);
 if clock1.Checked then
 begin
  frmMain.Caption := sDate + ' at ' + sCurrentTime;
  if bAlarmSet then
  begin
    dtNowTime := time;
    if dtNowTime > dtpickerAlarm.Time then
    begin
      iAlarmCorrection := 86400 + dOneSecond
    end
    else
    begin
      iAlarmCorrection := dOneSecond;
    end;
    sTimeToAlarm :=    formatdatetime('hh:nn:ss', dtpickerAlarm.Time -
        dtNowTime + iAlarmCorrection);
    frmMain.Caption := sDate + ' at ' + TimeToStr(dtCurrentTime) +
  '                Alarm Set: ' +  TimeToStr(dtpickerAlarm.Time)
+ '                Time to Alarm : ' +  sTimeToAlarm;
    lblAlarmCountDown.Caption := sTimeToAlarm;
  end;
  end
 else
 begin
  frmMain.Caption := sCurrentTime;
 end;
 Hours10 := TimeToStr(dtCurrentTime,fsFormat)[1];
 Hours01 := TimeToStr(dtCurrentTime,fsFormat)[2] + ':';
 Minutes10 := TimeToStr(dtCurrentTime,fsFormat)[4];
 Minutes01 := TimeToStr(dtCurrentTime,fsFormat)[5] + ':';
 Seconds10 := TimeToStr(dtCurrentTime,fsFormat)[7];
 Seconds01 := TimeToStr(dtCurrentTime,fsFormat)[8];
 sDate := DateToStr(dtCurrentTime,fsFormat);
 if Hours10 <> lblHours10.Caption then
 begin
  lblHours10.Caption := Hours10;
 end;
 if Hours01 <> lblHours01.Caption then
 begin
  lblHours01.Caption := Hours01;
 end;
 if Minutes10 <> lblMinutes10.Caption then
 begin
  lblMinutes10.Caption := Minutes10;
 end;
 if Minutes01 <> lblMinutes01.Caption then
 begin
  lblMinutes01.Caption := Minutes01;
 end;
 if Seconds10 <> lblSeconds10.Caption then
 begin
  lblSeconds10.Caption := Seconds10;
 end;
 if Seconds01 <> lblSeconds01.Caption then
 begin
  lblSeconds01.Caption := Seconds01;
 end;
 if sDate <> lblDate.Caption then
 begin
  lblDate.Caption := sDate;
 end;
 //Check to see if time to fire alarm if alarm is on
 if bAlarmSet then alarmTime(self);
end;
////////////////////////////////////////////////////////////////////////////////

procedure TfrmMain.actStayOnTopExecute(Sender: TObject);
begin
 if frmMain.FormStyle <> fsStayOnTop then
 begin
  frmMain.FormStyle := fsStayOnTop;
  frmMain.StayonTop1.Checked := True;
 end
 else
 begin
  frmMain.FormStyle := fsNormal;
  frmMain.StayonTop1.Checked := False;
 end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actClockColorExecute(Sender: TObject);
begin
  dialColorClock;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actClockExecute(Sender: TObject);
begin
 Clock1.Checked := True;
 dtTimeOffset := 0;
 lblDate.Visible := True;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.btnGoClick(Sender: TObject);
begin
 if countdown1.Checked then
  dtTimeOffset := -1*(Now+(dtPickerOffset.Time)) else
 if countup1.Checked then
  dtTimeOffset := -1 * Now();
 lblDate.Visible := False;
 dtPickerOffset.Visible := False;
 btnGo.Visible := False;
 btnCancel.Visible := False;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.btnStartDayClick(Sender: TObject);
begin
  dtPickerAlarm.Time := EncodeTime(7,30,00,00);
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.btnAddedTimeClick(Sender: TObject);
begin
  dtPickerAlarm.Time := mpcTruncateTime(Now,true) +
                        mpcTruncateTime(tpAddedTime.Time, true);
  end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.btnCancelClick(Sender: TObject);
begin
 btnCancel.Visible := False;
 btnGo.Visible := False;
 dtPickerOffset.Visible := False;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.btnEndOfDayClick(Sender: TObject);
begin
  dtPickerAlarm.Time := EncodeTime(16,30,00,00);
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actAlarmOnExecute(Sender: TObject);
begin
 pnlAlarm.Visible := False;
 lblAlarm1.Visible := True;
 lblAlarm2.Visible := True;
 lblAlarmCountDown.Visible := True;
 bAlarmSet := True;
 iSnoozeCountsRemaining :=  nbSnoozesAllowed.ValueInt + 1;
 btnSnooze.Caption := IntToStr(iSnoozeCountsRemaining - 1) + ' Snoozes left ';
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actAlarmOffExecute(Sender: TObject);
begin
 bAlarmSet := False;
 setOriginalVolume;
 pnlAlarm.Visible := False;
 lblAlarm1.Visible := False;
 lblAlarm2.Visible := False;
 lblAlarmCountDown.Visible := False;
 iSnoozeCountsRemaining :=  nbSnoozesAllowed.ValueInt + 1;
 btnSnooze.Caption := IntToStr(iSnoozeCountsRemaining - 1) + ' Snoozes left ' +
                      Copy(TimeToStr(tpSnoozeTime.Time),1,5);
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actAlarmSnoozeExecute(Sender: TObject);
var
 wHourAlarm, wMinuteAlarm, wSecondAlarm, wMilliAlarm : word;
begin
 SetOriginalVolume;
 Dec(iSnoozeCountsRemaining);
 if iSnoozeCountsRemaining > 0 then
 begin
  btnSnooze.Caption := IntToStr(iSnoozeCountsRemaining - 1) + ' Snoozes left ';
  dtPickerAlarm.Time := Time + mpcTruncateTime(tpSnoozeTime.Time, true);
 end
 else
 begin
   actAlarmOffExecute(self);
 end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actAlarmSetupExecute(Sender: TObject);
begin
  pnlAlarmSetup.Visible := True
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actAlarmPanelVisibleExecute(Sender: TObject);
begin
 pnlAlarm.Visible := True;
 if bAlarmSet then
 begin
   btnSnooze.Visible := True;
 end
 else
 begin
   btnSnooze.Visible := False;
 end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actAlarmSetupSaveExecute(Sender: TObject);
var
  reg : TRegistry;
begin
  pnlAlarmSetup.Visible := False;
  // Write the Start Time to the registry
  reg := TRegIniFile.Create('software\mpc\clock\AlarmSetup');
  reg.WriteTime('StartTime', tpStartDay.Time);
  reg.WriteTime('EndTime',tpEndDay.Time);
  reg.WriteTime('SnoozeTime', tpSnoozeTime.Time);
  reg.WriteTime('AddedTime', tpAddedTime.Time);
  reg.WriteInteger('SnoozesAllowed',nbSnoozesAllowed.ValueInt);
  btnStartDay.Caption := Copy(TimeToStr(tpStartDay.Time),1,5);
  btnEndOfDay.Caption := Copy(TimeToStr(tpEndDay.Time),1,5);
  btnSnooze.Caption := IntToStr(iSnoozeCountsRemaining - 1) + ' Snoozes left ' +
                       Copy(TimeToStr(tpSnoozeTime.Time),1,5);
  btnAddedTime.Caption := Copy(TimeToStr(tpAddedTime.Time),1,5) + ' add to now';
  iSnoozeCountsRemaining :=  nbSnoozesAllowed.ValueInt + 1;
  btnSnooze.Caption := IntToStr(iSnoozeCountsRemaining - 1) + ' Snoozes left ' +
                       Copy(TimeToStr(tpSnoozeTime.Time),1,5);
  reg.Free;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actAlarmSetupCancelExecute(Sender: TObject);
begin
   pnlAlarmSetup.Visible := False;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actAlarmFontExecute(Sender: TObject);
begin
 dialFontAlarm;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actDateColorExecute(Sender: TObject);
begin
 dialColorDate;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actFormColorExecute(Sender: TObject);
begin
 dialColorForm;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actClockFontExecute(Sender: TObject);
begin
 dialFontClock;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actDateFontExecute(Sender: TObject);
begin
 dialFontDate;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actAboutExecute(Sender: TObject);
var
  bExists: boolean;
  i: Integer;
begin
  bExists := False;
  for i := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[i].name = 'frmMPCAbout' then
      bExists := True;
  end;
  if not bExists then
  begin
    Application.CreateForm(TfrmAboutBox, frmMPCAbout);
  end;
  frmMPCAbout.ShowModal;
end;


procedure TfrmMain.timerScreenSaverTimer(Sender: TObject);
begin
//disable screen saver by simualting mouse move at specified interval
 JiggleMouse;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.JiggleMouse;
var
  Inpt: TInput;
begin
  Inpt.Itype := INPUT_MOUSE;
  Inpt.mi.dx := 0;
  Inpt.mi.dy := 0;
  Inpt.mi.mouseData := 0;
  Inpt.mi.dwFlags := MOUSEEVENTF_MOVE;
  Inpt.mi.time := 0;
  Inpt.mi.dwExtraInfo := 0;
  SendInput(1, Inpt, SizeOf(Inpt));
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.alarmTime(Sender: TObject);
var
 wHourNow, wMinuteNow,wSecondNow,wMilliNow : word;
 wHourAlarm, wMinuteAlarm, wSecondAlarm, wMilliAlarm : word;
 dtAlarm:TDateTime;
 nNow, nAlarm : double;
begin
 dtAlarm := dtpickerAlarm.Time;
 DecodeTime(Time,wHourNow,wMinuteNow,wSecondNow,wMilliNow);
 DecodeTime(dtAlarm,wHourAlarm,wMinuteAlarm,wSecondAlarm,wMilliAlarm);
 nNow := 3600 * wHourNow + 60 * wMinuteNow + wSecondNow;
 nAlarm := 3600 * wHourAlarm + 60 * wMinuteAlarm + wSecondAlarm;
 if ((abs(nAlarm - nNow) < 30) and (nAlarm - nNow <= 0)) then
 begin
  GetOriginalVolume;
  SetAlarmVolume;
  windows.beep(400,750);
  //This should work, but doesn't
  //SetOriginalVolume;
  //This is the same as above, and it works just fine
  endpointVolume.SetMute(bOriginalMute,nil);
  endpointVolume.SetMasterVolumeLevelScalar(singleBeginningVolumeLevel, nil);
  //end of wierd problem
  actAlarmPanelVisibleExecute(self);
 end;
 if (nAlarm - nNow = -30)and (iSnoozeCountsRemaining >= 0)then
 begin
  actAlarmSnoozeExecute(self);
 end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.GetOriginalVolume;
begin
  endpointvolume.GetMute(bOriginalMute);
  endpointvolume.GetMasterVolumeLevelScaler(singleBeginningVolumeLevel);
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.setOriginalVolume;
begin
  endpointVolume.SetMute(bOriginalMute,nil);
  endpointVolume.SetMasterVolumeLevelScalar(singleBeginningVolumeLevel, nil);
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.setAlarmVolume;
begin
  endpointvolume.SetMute(False,nil);
  endpointVolume.SetMasterVolumeLevelScalar(singleAlarmVolumeLevel, nil);
end;
////////////////////////////////////////////////////////////////////////////////


//TO DO /////////////////////////////////////////////
procedure TfrmMain.actCountDownExecute(Sender: TObject);
begin
 CountDown1.Checked := True;
 dtPickerOffSet.Visible := True;
 btnGo.Visible := True;
 btnCancel.Visible := True;
end;
////////////////////////////////////////////////////////////////////////////////
procedure TfrmMain.actCountUpExecute(Sender: TObject);
begin
 CountUp1.Checked := True;
 btnGo.Visible := true;
 btnCancel.Visible := True;
end;


function TfrmMain.mpcTruncateTime(dtTime : TDateTime; bSecondsIs0 : boolean) : TTime;
var
  wHours,wMinutes,wSeconds,wMilSeconds : word;
begin
  DecodeTime(dtTime,wHours,wMinutes,wSeconds,wMilSeconds);
  if bSecondsIs0 then
    result := StrToTime(IntToStr(wHours) + ':' + IntToStr(wMinutes) + ':' + '00')
  else
    result := StrToTime(IntToStr(wHours) + ':' + IntToStr(wMinutes) + ':' + IntToStr(wSeconds));
end;
end.
