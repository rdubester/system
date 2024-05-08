# File for configuring nix darwin
# https://nix-community.github.io/home-manager/options.html
# https://github.com/LnL7/nix-darwin/blob/master/modules/homebrew.nix

{ pkgs, ... }: {

  imports = [ ./modules/pyenv.nix ./modules/fish.nix ./modules/lindy.nix ./modules/stablediffusion.nix];

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
      exa
    ];

  # home-manager options: https://nix-community.github.io/home-manager/options.html
  home-manager = {
    users.reuben = { 
      # settings loaded here can be found in
      # darwinConfigurations.Station.config.home-manager.users.reuben.programs
      imports = [
        ./home/alacritty.nix
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

    brews = [
      "httpie"
      "gradle"
      "openjdk@11"
      "helm"
      "telnet"
      "elan-init"
      "ffmpeg"
      "graphviz"
      "pipx"
      "podman"
      "mongodb-database-tools"
      "mongodb-atlas-cli"
    ];

    casks = [
      "1password"
      "ngrok"
      "alacritty"
      "background-music"
      "discord"
      "google-chrome"
      "google-drive"
      "loom"
      "minecraft"
      "obsidian"
      "podman-desktop"
      "slack"
      "spotify"
      "steam"
      "visual-studio-code"
      "zoom"
    ];

  };

}
