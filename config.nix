# File for configuring nix darwin
# https://github.com/LnL7/nix-darwin/blob/master/modules/homebrew.nix


{ pkgs, ... }: {

  imports = [ ./modules/fish.nix ./modules/lindy.nix];

  environment.systemPackages = with pkgs; [dig];

  services.nix-daemon.enable = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';


  programs.zsh.enable = true;

  # home-manager options: https://nix-community.github.io/home-manager/options.html
  home-manager = {
    users.reuben = { 
      imports = [
        ./home/git.nix
        ./home/neovim.nix
        ./home/fish.nix
        ./home/nvm.nix
      ];
      home.stateVersion = "22.11";
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
  };

  homebrew = {

    enable = true;

    global.brewfile = true;

    global.autoUpdate = false;

    taps = map ( s: "homebrew/${s}" ) [
      "core"
      "cask"
      "bundle"
    ];

    casks = [
      "1password"
      "discord"
      "docker"
      "google-chrome"
      "obsidian"
      "slack"
      "spotify"
      "steam"
      "visual-studio-code"
      "zoom"
    ];

  };


}
