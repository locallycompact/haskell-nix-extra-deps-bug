{ nixpkgs }:

let
  spec = builtins.fromJSON (builtins.readFile ./haskell-nix-src.json);
  haskell-nix-src = (import nixpkgs {}).fetchgit {
    name = "haskell-lib";
    inherit (spec) url rev sha256 fetchSubmodules;
  };
in
  import nixpkgs (import haskell-nix-src)
