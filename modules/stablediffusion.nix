{ pkgs, ... }: {

    homebrew = {

        brews = [
            "cmake"
            "protobuf"
            "rust"
            "python@3.10"
            "git"
            "wget"
        ];

    };
}