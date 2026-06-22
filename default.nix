{pkgs ? import <nixpkgs> {}}:
pkgs.stdenvNoCC.mkDerivation rec {
  pname = "noto-fonts-bengali";
  version = "3.011";

  src = pkgs.fetchzip {
    url = "https://github.com/notofonts/bengali/releases/download/NotoSansBengali-v${version}/NotoSansBengali-v${version}.zip";

    stripRoot = false;

    hash = "sha256-BTDhs1eR6R9ITbAHzJoqibeF6TNq6l5IXj+HQqQ5Rq0=";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    find $src -name "*.ttf" -exec cp {} $out/share/fonts/truetype/ \;
  '';

  meta = with pkgs.lib; {
    description = "Noto Sans Bengali fonts (v3.011 GitHub Release)";
    homepage = "https://github.com/notofonts/bengali";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
