let
  # Import the Haskell.nix library,
  pkgs = import ./haskell.nix { nixpkgs = ./fetch-nixpkgs.nix;};

  # Import the file you will create in the stack-to-nix or cabal-to-nix step.
  my-pkgs = import ./pkgs.nix;

  # Stack projects use this:
  pkgSet = pkgs.haskell-nix.mkStackPkgSet {
    stack-pkgs = my-pkgs;
  };

in pkgSet.config.hsPkgs // { _config = pkgSet.config; }
