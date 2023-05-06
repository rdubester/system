{ pkgs, ... }: {

  imports = [ ./fish.nix ];

  environment.systemPackages = with pkgs; [dig];

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;

  home-manager = {
    users.reuben = { imports = [
      ./home/git.nix
      ];
    };
    useGlobalPkgs = true;
    useUserPkgs = true;
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
      "spotify"
      "visual-studio-code"
    ];
  };
}
