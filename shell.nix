{ pkgs ? import ./nix/fetch-nixpkgs.nix {} }:

let
  hsPkgs = import ./nix/default.nix;
in
  hsPkgs.shellFor {
    withHoogle = true;

    buildInputs = with pkgs.haskellPackages;
      [ pkgs.ffmpeg-full pkgs.imagemagick pkgs.zlib.out pkgs.librsvg pkgs.fsatrace shake];

    LD_LIBRARY_PATH="${pkgs.zlib.out}/lib";
    exactDeps = true;
  }
