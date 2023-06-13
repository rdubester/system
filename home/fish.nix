# https://github.com/nix-community/home-manager/blob/master/modules/programs/fish.nix

{ lib, pkgs, ... }: {

    programs.fish = {

        enable = true;

        shellAbbrs = {
            system = "code-insiders ~/system";
            hgrep = "history | grep";
            htail = "history | tail";
            
            l = "exa";
            ls = "exa";
            la = "exa -a";
            ll = "exa -l";
            lL = "exa -algiSH --git";
            lt = "exa -lT";
        };

        functions = {
            fish_greeting = {
                body = ''
                set_color $fish_color_autosuggestion
                uname -nmsr
                command -s uptime >/dev/null
                and command uptime
                set_color normal
                '';
            };
        };

        shellInit = lib.optionalString pkgs.stdenvNoCC.isDarwin ''
        test -d /opt/homebrew/bin; and eval (/opt/homebrew/bin/brew shellenv)
        
        # path
        fish_add_path /opt/homebrew/opt/openssl@3/bin
        fish_add_path /Users/reuben/.nvm/versions/node/v18.14.0/bin
        fish_add_path /opt/homebrew/opt/openjdk/bin
        fish_add_path $PYENV_ROOT/bin

        # PYENV
        set -Ux PYENV_ROOT $HOME/.pyenv
        pyenv init - | source
        '';
    };
}