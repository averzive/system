{
  description = ''''; # TODO

  inputs = {
    discord = {
      url = "github:kaylorben/nixcord/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spotify = {
      url = "github:gerg-l/spicetify-nix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flow = {
      url = "github:averzive/flow-browser-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/hyprland/main";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts/main";
  };

  outputs = inputs:
    import ./outputs {
      inherit inputs;
      meta = import ./meta.nix;

      hosts = ./hosts;
      users = ./users;

      system = ./system;
      home = ./home;
    };
}
