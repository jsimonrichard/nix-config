{ pkgs, ... }: ''
windowrule = workspace 1 silent, obsidian
windowrule = workspace 2 silent, brave

exec-once = obsidian
exec-once = brave

exec-once = ${pkgs.writeScriptBin "clear-window-rules.sh" ''
sleep 10
hyprctl keyword windowrule "workspace unset, obsidian"
hyprctl keyword windowrule "workspace unset, brave"
''}/bin/clear-window-rules.sh >clear-window-rules.log 2>&1
''