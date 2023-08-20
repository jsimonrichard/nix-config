{ pkgs, lib, config, ... }:
let inherit (lib) types mkIf mkOption strings;
in {
  options.services.greetd = {
    tuigreet = {
      enable = mkOption {
        description = "Enable the tuigreet greeter";
        type = types.bool;
        default = false;
      };

      defaultCmd = mkOption {
        description = "The default environment for tuigreet to run after logging in the user";
        type = types.str;
        default = "bash";
      };
    };

    environments = mkOption {
      description = "A list of installed commands";
      type = types.listOf types.str;
      default = [];
    };
  };

  config = {
    environment.etc."greetd/environments".text = mkIf config.services.greetd.enable
      (strings.concatStringsSep "\n" config.services.greetd.environments);

    environment.systemPackages = mkIf config.services.greetd.tuigreet.enable [ pkgs.greetd.tuigreet ];

    services.greetd.settings.default_session = mkIf config.services.greetd.tuigreet.enable {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --user-menu --asterisks --time --cmd ${config.services.greetd.tuigreet.defaultCmd}";
    };
  };
}