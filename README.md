### System Configuration Using Nix

flake.nix defines inputs for the various libraries and repos we need
(nixpkgs, darwin, home-manager)
It uses those inputs to configure the `Station` hostname, by calling the
darwin.lib.darwinSystem function.

The darwinSystem function takes in a path to a config.nix file. Here we configure a few things like enabling nix-flakes, enabling zsh, etc.
We also add some system packages (command line utilities).
We configure home manager by passing in as imports the files defined
in the /home directory, which configure all of the specific services
we have installed at the user level.
Finally we configure homebrew and select a few core taps, as well
as installing all the casks (applications like chrome, obsidian, etc.)

Using flake, home-manager, and darwin to configure my macOS.

types: https://github.com/NixOS/nixpkgs/blob/master/lib/types.nix

search for packages: https://search.nixos.org/packages

repl https://github.com/i077/system/blob/master/Justfile#L31