{ pkgs, ... }: {
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      ms-python.python
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
      vscodevim.vim
      github.copilot
      rust-lang.rust-analyzer
      # christian-kohler.path-intellisense
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "remote-ssh-edit";
        publisher = "ms-vscode-remote";
        version = "0.47.2";
        sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
      {
        name = "tokyo-night";
        publisher = "enkia";
        version = "1.0.0";
        sha256 = "sha256-/fM+aUDUzVJ6P38i+GrxhLv2eLJNa8OFkKsM4yPBy4c=";
      }
      {
        name = "vscode-mdx";
        publisher = "unifiedjs";
        version = "1.4.0";
        sha256 = "sha256-qqqq0QKTR0ZCLdPltsnQh5eTqGOh9fV1OSOZMjj4xXg=";
      }
    ];

    userSettings = {
      "editor.formatOnSave" = true;
      "editor.fontSize" = 14;
      "editor.lineHeight" = 24;
      "editor.fontFamily" = "MesloLGS NF, monospace";
      "editor.fontLigatures" = true;
      "editor.tabSize" = 2;
      "editor.rulers" = [80 100];
      "breadcrumbs.enabled" = true;
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "terminal.integrated.fontFamily" = "MesloLGS NF";
      "window.menuBarVisibility" = "toggle";
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "window.zoomLevel" = 1;
      "workbench.colorTheme" = "Tokyo Night";
    };
  };
}