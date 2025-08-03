{
 description = "The NixOS config of u200b";

 inputs = {
   nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
   home-manager.url = "github:nix-community/home-manager";
   home-manager.inputs.nixpkgs.follows = "nixpkgs";
   zen-browser.url = "github:MarceColl/zen-browser-flake";
   nix-gaming.url = "github:fufexan/nix-gaming";
 };

 outputs = { self, nixpkgs, home-manager, ... }@inputs:
   let
     system = "x86_64-linux";
     lib = nixpkgs.lib;
     pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
     };
   in {
     nixosConfigurations = {
       main = lib.nixosSystem {
         inherit system;
         specialArgs = { inherit inputs; };
         modules = [
           ./hosts/main/configuration.nix { nixpkgs = { inherit pkgs; }; }
           ./hosts/main/hardware-configuration.nix

           home-manager.nixosModules.home-manager
           {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;
             home-manager.backupFileExtension = "backup";
             home-manager.users.u200b = import ./hosts/main/home.nix {
              inherit pkgs lib;
             };
           }
         ];
       };
     };
     devShells.${system} = {
       python = import ./dev-shells/python.nix { inherit pkgs; };
       v = import ./dev-shells/vlang.nix {inherit pkgs; };
     };
  };
}