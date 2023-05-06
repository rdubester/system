{ lib, ... }: let
    inherit (lib) mkBefore mkAfter mkMerge;
in {
    
    programs.fish.enable = true;

    environment.etc."fish/nixos-env-preinit.fish".text = mkMerge [
    (mkBefore ''
      set -l oldPath $PATH
    '')
    (mkAfter ''
      for elt in $PATH
        if not contains -- $elt $oldPath /usr/local/bin /usr/bin /bin /usr/sbin /sbin
          set -ag fish_user_paths $elt
        end
      end
      set -el oldPath
    '')
  ];

}