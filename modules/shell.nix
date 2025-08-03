{pkgs, ...}:
{
 environment.shellAliases = {
  rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#main";
 };
 programs.fish.enable = true;
}