{
  description = "J. Simon Richard's NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Add any other flake you might need
    nixos-hardware.url = "github:nixos/nixos-hardware";

    rust-overlay.url = "github:oxalica/rust-overlay";

    # anyrun = {
    #   url = "github:Kirottu/anyrun";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, ... }@inputs: {
    
    # checks.x86_64-linux = builtins.getAttr "config.system.build.toplevel" nixosConfigurations.elendil;
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      elendil = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        # > Our main nixos configuration file <
        modules = [
          ./nixos/configuration.nix
          nixos-hardware.nixosModules.dell-xps-13-9380

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.jsimonrichard = import ./home-manager/home.nix;
          }
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    # homeConfigurations = {
    #   "jsimonrichard@elendil" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        
    #     extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
    #     # > Our main home-manager configuration file <
    #     modules = [ ./home-manager/home.nix ];
    #   };
    # };
  };
}
