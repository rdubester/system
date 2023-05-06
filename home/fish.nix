{ lib, pkgs, ... }: {

    programs.fish = {

        enable = true;

        shellInit = lib.optionalString pkgs.stdenvNoCC.isDarwin ''
        test -d /opt/homebrew/bin; and eval (/opt/homebrew/bin/brew shellenv)
        '';
    };
}