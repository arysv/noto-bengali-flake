# Nix Bangla Fonts
A Nix Flake to easily package and install high-quality Bengali fonts (currently featuring Noto Sans Bengali) on NixOS and other Nix-enabled systems.

## Usage
Add this repository to your `flake.nix` inputs:
```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    bangla-fonts.url = "github:sorexw/noto-bengali-flake"; 
  };

  outputs = { self, nixpkgs, bangla-fonts, ... }: {
    nixosConfigurations.<your_machine_name> = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ config, pkgs, ... }: {
          fonts.packages = [
            bangla-fonts.packages.x86_64-linux.noto-fonts-bengali
          ];
        })
      ];
    };
  };
}
```

## Available Packages
- `noto-fonts-bengali`: Fetches the latest release of Noto Sans Bengali directly from the official GitHub repository.

## Adding More Fonts
- Contribute this project and hit a PR.

## License
- The **Nix** code in this repository is licensed under the [MIT License](https://raw.githubusercontent.com/sorexw/noto-bengali-flake/main/LICENSE)
- The **Fonts** downloaded and installed by this flake are subject to their respective creators' licenses (e.g., the [SIL Open Font License (OFL)](https://raw.githubusercontent.com/notofonts/bengali/main/OFL.txt) for Noto Sans).

