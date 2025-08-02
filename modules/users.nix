{pkgs, ...}:
{
  users.users.u200b = {
    isNormalUser = true;
    description = "u200b";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}