{ pkgs, ... }: {
  home.packages = with pkgs; [ zoom-us ];
  xdg.configFile."zoomus.conf".text = ''
    [General]
    # GeoLocale=system
    # SensitiveInfoMaskOn=true
    # autoPlayGif=false
    # autoScale=true
    # bForceMaximizeWM=false
    # captureHDCamera=true
    # chatListPanelLastWidth=230
    # conf.webserver=https://us04web.zoom.us
    # conf.webserver.vendor.default=https://zoom.us
    # currentMeetingId=
    # deviceID=60:E3:2B:4A:66:A9
    # enable.host.auto.grab=arue
    # enableAlphaBuffer=true
    # enableCefGpu=false
    # enableCloudSwitch=true
    # enableLog=true
    # enableMiniWindow=false
    # enableQmlCache=true
    # enableScreenSaveGuard=false
    # enableStartMeetingWithRoomSystem=false
    # enableTestMode=false
    enableWaylandShare=true
    # enableWebviewDevTools=false
    # enablegpucomputeutilization=false
    # fake.version=
    # flashChatTime=0
    # forceEnableTrayIcon=true
    # forceSSOURL=
    # host.auto.grab.interval=10
    # isTransCoding=false
    # logLevel=info
    # newMeetingWithVideo=true
    # noSandbox=false
    # playSoundForNewMessage=false
    # scaleFactor=1
    # shareBarTopMargin=0
    # speaker_volume=80
    # sso_domain=.zoom.us
    # sso_gov_domain=.zoomgov.com
    # system.audio.type=pulse
    # timeFormat12HoursEnable=true
    # upcoming_meeting_header_image=
    # useSystemTheme=false
    # userEmailAddress=

    [AS]
    showframewindow=true
  '';
}