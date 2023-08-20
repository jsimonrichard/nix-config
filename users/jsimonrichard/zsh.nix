{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    oh-my-zsh
    zsh-powerlevel10k
  ];
  
  programs.zsh = {
    enable = true;
    shellAliases = {
      snrsf = "sudo nixos-rebuild switch --flake";
    };
    initExtra = ''
      [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "python" "man" ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
    ];
  };
}