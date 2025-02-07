{
  description = "Home Manager configuration of phil";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, catppuccin, home-manager, android-nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."phil" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          catppuccin.homeManagerModules.catppuccin

        #    {
        #   home-manager.users.myusername = { config, lib, pkgs, ... }: {
        #     imports = [
        #       android-nixpkgs.hmModule
        #
        #       {
        #         inherit config lib pkgs;
        #         android-sdk.enable = true;
        #
        #         # Optional; default path is "~/.local/share/android".
        #         android-sdk.path = "${config.home.homeDirectory}/.android/sdk";
        #
        #         android-sdk.packages = sdk: with sdk; [
        #           build-tools-34-0-0
        #           cmdline-tools-latest
        #           emulator
        #           platforms-android-34
        #           sources-android-34
        #         ];
        #       }
        #     ];
        #   };
        # }
        
        ];
  

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
