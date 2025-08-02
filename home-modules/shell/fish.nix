{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      { name = "tide";           src = pkgs.fishPlugins.tide.src; }
      { name = "autopair.fish";  src = pkgs.fishPlugins.autopair.src; }
      { name = "puffer-fish";    src = pkgs.fishPlugins.puffer.src; }
      { name = "done";           src = pkgs.fishPlugins.done.src; }
    ];
    interactiveShellInit = ''
      set fish_greeting
      ${import ./fish_vars.nix}
      fastfetch
    '';
  };
  programs.bash = {
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
