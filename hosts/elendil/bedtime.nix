{ pkgs, config, ... }: {
  systemd.user.timers.bedtime = {
    description = "Bedtime";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 22:30:00";
      Persistent = true;
    };
  };
  systemd.user.services.bedtime = {
    description = "Bedtime";
    wantedBy = [ "multi-user.target" ];
    requires = [ "dbus.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''${pkgs.dunst}/bin/dunstify -a bedtime Bedtime "It's time to go to bed!"'';
    };
  };
}