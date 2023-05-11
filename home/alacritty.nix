# https://github.com/alacritty/alacritty/blob/master/alacritty.yml

{ pkgs, ... }: {

    programs.alacritty.enable = true;

    programs.alacritty.settings = {
        
        # Shell Config
        shell.program = "/etc/profiles/per-user/reuben/bin/fish";

        # Window Config
        window = {
            padding = {
                x = 12;
                y = 12;
            };
            dynamic_padding = false;
            decorations = "buttonless";
        };
    };
}