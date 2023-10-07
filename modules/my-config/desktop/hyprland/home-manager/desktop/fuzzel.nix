{ pkgs, ... }: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Inter";
        horizontal-pad = 0;
        prompt = "' > '";
        terminal = "${pkgs.kitty}/bin/kitty";
      };
      colors = {
        background = "24283baa";
        text = "c0caf5ff";
        match = "f7768eff";
        selection = "1a1b2677";
        selection-text = "c0caf5ff";
        selection-match = "f7768eff";
        border = "00000000";
      };
    };
  };

  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur, launcher"
      "noanim, launcher"
    ];

    bindr = [
      "SUPER, Super_L, exec, ${pkgs.fuzzel}/bin/fuzzel"
    ];
  };
}