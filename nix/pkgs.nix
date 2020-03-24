{
  extras = hackage:
    {
      packages = {
        "slick" = (((hackage.slick)."1.0.1.1").revisions).default;
        "reanimate-svg" = (((hackage.reanimate-svg)."0.9.8.0").revisions).default;
        haskell-nix-extra-deps-bug = ./haskell-nix-extra-deps-bug.nix;
        reanimate = ./reanimate.nix;
        };
      };
  resolver = "lts-14.27";
  modules = [ ({ lib, ... }: { packages = {}; }) { packages = {}; } ];
  }