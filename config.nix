{ pkgs, ... }: {

  imports = [ ./fish.nix ];

  environment.systemPackages = with pkgs; [dig];

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;

  home-manager = {
    users.reuben = { 
      imports = [
        ./home/git.nix
        ./home/neovim.nix
        ./home/fish.nix
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
      "visual-studio-code"
      "1password"
      "obsidian"
      "google-chrome"
      "slack"
      "linear-linear"
      "discord"
      "spotify"
    ];
  };
}
