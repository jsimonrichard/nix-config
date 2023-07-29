{ pkgs, ... }: {
  programs.brave = {
    enable = true;
    extensions = [
      { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; } # 1 Password
      { id = "piajkpdbaniagacofgklljacgjhefjeh"; } # Advanced Profanity Filter
      { id = "cppjkneekbjaeellbfkmgnhonkkjfpdn"; } # Clear cache
      { id = "fmkadmapgofadopljbjfkapdkoienihi"; } # React Dev Tools
      { id = "ekhagklcjbdpajgpjgmbionohlpdbjgc"; } # Zotero Connector
      { id = "chlffgpmiacpedhhbkiomidkjlcfhogd"; } # Pushbullet
    ];
  };

  home.sessionVariables.BROWSER = "${pkgs.brave}/bin/brave";
}