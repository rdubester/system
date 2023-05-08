{
  description = "System configuration with Nix";
 
  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, darwin, home-manager }: {

    darwinConfigurations."Station" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ ./config.nix home-manager.darwinModule ];
    };
  };

}
