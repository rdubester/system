# https://github.com/nix-community/home-manager/blob/master/modules/programs/fish.nix

{ lib, pkgs, ... }: {

    home.file."lindy.fish".source = ./fish_functions/lindy.fish;

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

            worker-start = "pkill -9 -f 'classes/master.js'; pkill -9 -f 'worker/index.ts'; env WORKER_CONCURRENCY=1 pnpm worker:watch";

            gbr = "git branch";
            gup = "git fetch origin; git rebase origin/main";
            gcan = "git commit -a --amend --no-edit";
            gcopy = "git rev-parse HEAD | tr -d '\n' | pbcopy; echo 'Copied rev'";

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

            lindy = {
                body = builtins.readFile ./fish_functions/lindy.fish;
            };
        };

        shellInit = lib.optionalString pkgs.stdenvNoCC.isDarwin ''
        test -d /opt/homebrew/bin; and eval (/opt/homebrew/bin/brew shellenv)
        
        # path
        fish_add_path /opt/homebrew/opt/openssl@3/bin
        fish_add_path /Users/reuben/.nvm/versions/node/v20.11.0/bin
        fish_add_path /opt/homebrew/opt/openjdk/bin
        fish_add_path $PYENV_ROOT/bin
        fish_add_path /Users/reuben/google-cloud-sdk/bin
        fish_add_path /Applications/Docker.app/Contents/Resources/bin
        fish_add_path /Users/reuben/.local/bin

        # PYENV
        set -Ux PYENV_ROOT $HOME/.pyenv
        pyenv init - | source
        '';
    };
}