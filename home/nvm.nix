# https://nix-community.github.io/home-manager/options.html

{ pkgs, ... }: {

    home.file.".nvm".source = pkgs.fetchFromGitHub {
        owner = "nvm-sh";
        repo = "nvm";
        rev = "v0.39.3";
        hash = "sha256-ElP9vSj1CpC4Tkwu8W2JDF8f1P5wcxtunPX8TSR9ViE=";
    };

    programs.fish.plugins = [
        {
            name = "bass";
            src = pkgs.fishPlugins.bass.src;
        }
    ];

    programs.fish.functions = {
        
        nvm = ''
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
        '';

        nvm_find_nvmrc = ''
        bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
        '';

        load_nvm = {
            onVariable="PWD";
            body = ''
            set -l default_node_version (nvm version default)
            set -l node_version (nvm version)
            set -l nvmrc_path (nvm_find_nvmrc)
            if test -n "$nvmrc_path"
                set -l nvmrc_node_version (nvm version (cat $nvmrc_path))
                if test "$nvmrc_node_version" = "N/A"
                    nvm install (cat $nvmrc_path)
                else if test "$nvmrc_node_version" != "$node_version"
                    nvm use $nvmrc_node_version
                end
            else if test "$node_version" != "$default_node_version"
                echo "Reverting to default Node version"
                nvm use default
            end
            '';
        };
        
    };
    

}
