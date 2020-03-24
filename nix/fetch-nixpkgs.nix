let
  spec = builtins.fromJSON (builtins.readFile ./nixpkgs-src.json);
in
import (builtins.fetchTarball {
  name = "nixos-unstable-${spec.rev}";
  url = "${spec.url}/archive/${spec.rev}.tar.gz";
  sha256 = "${spec.sha256}";
})
