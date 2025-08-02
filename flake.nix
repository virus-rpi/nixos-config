{
 description = "The NixOS config of u200b";

 inputs = {
   nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
   home-manager.url = "github:nix-community/home-manager";
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
   zen-browser.url = "github:MarceColl/zen-browser-flake";
   nix-gaming.url = "github:fufexan/nix-gaming";
 };

 outputs = { self, nixpkgs, home-manager, ... }:
     let
       system = "x86_64-linux";
       lib = nixpkgs.lib;
     in {
       nixosConfigurations = {
         main = lib.nixosSystem {
           inherit system;
           modules = [
             ./hosts/main/configuration.nix
             ./hosts/main/hardware-configuration.nix

             home-manager.nixosModules.home-manager
             {
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;
               home-manager.users.u200b = import ./hosts/main/home.nix;
             }
           ];
         };
       };
     };
}