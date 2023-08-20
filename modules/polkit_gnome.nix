{ pkgs, lib, config, ... }: 
let inherit (lib) types mkIf mkOption;
in {
  options.security.polkit.gnome.enable = mkOption {
    description = "Enable the GNOME Polkit";
    type = types.bool;
    default = false;
  };

  config = mkIf config.security.polkit.gnome.enable {
    environment.systemPackages = with pkgs; [
      polkit_gnome
    ];

    security.polkit = {
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (
            subject.isInGroup("users")
              && (
                action.id == "org.freedesktop.login1.reboot" ||
                action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
                action.id == "org.freedesktop.login1.power-off" ||
                action.id == "org.freedesktop.login1.power-off-multiple-sessions" ||
              )
            )
          {
            return polkit.Result.YES;
          }
        })
      '';
    };
    
    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
          };
      };
    };
  };
}