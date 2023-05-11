{ pkgs, ... }: {

    programs.alacritty.enable = true;

    programs.alacritty.settings = {
        # Window Config
        window.padding = {
            x = 12;
            y = 12;
        };
        dynamic_padding =  false; #enables padding as explained in- https://superuser.com/questions/1689645/what-does-the-argument-parameter-dynamic-padding-do-exactly-in-the-alacritty-t

        # Decorations (Example Config- https://sunnnychan.github.io/cheatsheet/linux/config/alacritty.yml.html)
        decorations = buttonless;
        
        #decorations: full
        #Full has all window decorations (regular MacOS style), buttonless has no decorations and works on BigSur ["full", "none", "buttonless"]

        # Background Opacity
        opacity =  0.9; #if commented out, set to 100%
    };
}