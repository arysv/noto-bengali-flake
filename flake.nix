{
  description = "Nix flake for Noto Sans Bengali";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    packages.${system} = {
      noto-fonts-bengali = pkgs.callPackage ./default.nix {};
      default = self.packages.${system}.noto-fonts-bengali;
    };

    overlays.default = final: prev: {
      noto-fonts-bengali = final.callPackage ./default.nix {};
    };
  };
}
