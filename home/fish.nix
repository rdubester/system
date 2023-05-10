# https://nix-community.github.io/home-manager/options.html
# https://github.com/nix-community/home-manager/blob/master/modules/programs/fish.nix

{ lib, pkgs, ... }: {

    programs.fish = {

        enable = true;

        shellInit = lib.optionalString pkgs.stdenvNoCC.isDarwin ''
        test -d /opt/homebrew/bin; and eval (/opt/homebrew/bin/brew shellenv)
        fish_add_path /opt/homebrew/opt/openssl@3/bin
        set -Ux PYENV_ROOT $HOME/.pyenv
        set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
        pyenv init - | source
        '';
    };
}