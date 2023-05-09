# https://nix-community.github.io/home-manager/options.html
# https://github.com/nix-community/home-manager/blob/master/modules/programs/fish.nix

{ lib, pkgs, ... }: {

    programs.fish = {

        enable = true;

        shellInit = lib.optionalString pkgs.stdenvNoCC.isDarwin ''
        test -d /opt/homebrew/bin; and eval (/opt/homebrew/bin/brew shellenv)
        '';
    };
}