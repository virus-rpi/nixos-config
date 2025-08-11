{pkgs, ...}:
{
 environment.shellAliases = {
  rebuild = "sudo nixos-rebuild switch --flake /home/u200b/.config/nixos-config#main";
  update = "sudo nix flake update --flake /home/u200b/.config/nixos-config";
 };
 programs.fish.enable = true;
}
