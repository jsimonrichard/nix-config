{ pkgs, ... }: {
  imports = [
    ./utilities.nix
    ./vscode.nix
    ./brave.nix
    ./zsh.nix
    ./kitty.nix
    ./_1password.nix
    ./spotify.nix
    ./obsidian.nix
    ./python.nix
    ./sage.nix
    ./zoom.nix
    ./rust.nix
    ./discord.nix
    ./node.nix
    ./c.nix
  ];

  home.packages = with pkgs; [
    foliate
    ranger

    # Bible app
    sword
    xiphos 
  ];
}