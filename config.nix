# File for configuring nix darwin
# https://github.com/LnL7/nix-darwin/blob/master/modules/homebrew.nix

{ pkgs, ... }: {

  imports = [ ./modules/pyenv.nix ./modules/fish.nix ./modules/lindy.nix];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  
  environment.systemPackages = with pkgs; [
      dig
      htop
      jq
      tmux
      tree
    ];

  # home-manager options: https://nix-community.github.io/home-manager/options.html
  home-manager = {
    users.reuben = { 
      imports = [
        ./home/fish.nix
        ./home/git.nix
        ./home/neovim.nix
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
    global.autoUpdate = true;

    taps = map ( s: "homebrew/${s}" ) [
      "bundle"
      "cask"
      "core"
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
