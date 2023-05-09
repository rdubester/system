{ pkgs, ... }: {

    homebrew = {

        taps = [
          "mongodb/brew"
        ];

        casks = [
            "mongodb-compass"
            "linear-linear"

        ];

        brews = [
            "mongodb-community@6.0"
            "redis"
        ];

    };
}