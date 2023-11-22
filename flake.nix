{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      mkHost = hostName: system:
        (nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
            modules = [
              # Custom Modules
              ./modules

              # Global nixos configuration
              ./configuration.nix
              ./cachix.nix

              # Host-specific config, if exist
              (if (builtins.pathExists
                ./hosts/${hostName}/configuration.nix) then
                (import ./hosts/${hostName}/configuration.nix {
                  inherit inputs;
                  pkgs = import nixpkgs {
                    inherit system;
                    config.allowUnfree = true;
                  }; #.legacyPackages.${system};
                })
              else
                { })

              # Module 2: entry point
              {
                system.configurationRevision = if (self ? rev) then
                  self.rev
                else
                  throw "refuse to build: git tree is dirty";
                system.stateVersion = "23.05";
                imports = [
                  "${nixpkgs}/nixos/modules/installer/scan/not-detected.nix"
                  # "${nixpkgs}/nixos/modules/profiles/hardened.nix"
                  # "${nixpkgs}/nixos/modules/profiles/qemu-guest.nix"
                ];
              }

              # Include Home Manager
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs; };
              }
            ];
          });
    in {
      nixosConfigurations = {
        elendil = mkHost "elendil" "x86_64-linux";
        gramr = mkHost "gramr" "x86_64-linux";
        excalibur = mkHost "excalibur" "x86_64-linux";

        installer = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./installer
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
            {
              system.configurationRevision = if (self ? rev) then
                self.rev
              else
                throw "refuse to build: git tree is dirty";
              system.stateVersion = "23.05";
            }
          ];
        };
      };
    };
}
