{ pkgs, ... }: {
  imports = [
    ./utilities.nix
    ./vscode.nix
    ./brave.nix
    ./kitty.nix
    ./_1password.nix
    ./spotify.nix
    ./obsidian.nix
    ./python.nix
    ./sage.nix
    ./zoom.nix
    ./discord.nix
    ./node.nix
    ./c.nix
    ./rust.nix
    ./ranger
    ./zathura.nix
    ./libreoffice.nix
    ./zotero.nix
  ];

  home.packages = with pkgs; [
    foliate

    # Bible app
    sword
    xiphos
  
    # Dev things
    postgresql
    typeshare
    wl-clipboard
    musescore
    evince
    inkscape
    texlive.combined.scheme-full
    gimp
    blender
    onedrive
    godot_4
    jetbrains.rust-rover
    zig
    gnome.simple-scan
    kicad-small
    ollama
    figma-linux
    eclipses.eclipse-java
    vlc
  ];
}
