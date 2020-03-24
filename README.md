# Haskell.nix extra-deps shellFor bug

This repo show the extra-deps bug.

When the extra-dep is specified as reanimate-0.2.0.2, then the command works fine:

```
nix-shell --command shake
```

But if we change the extra dep to a git/commit

```
- git: https://github.com/Lemmih/reanimate
  commit: 8c7f4f34b75c1c410ce4b951b4410ae9a2b26031
```

and rerun `stack-to-nix`, then the command no longer works and cannot find reanimate
