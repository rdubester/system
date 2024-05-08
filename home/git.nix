{ ... }: {

    programs.git = {
        
        enable = true;
        userName = "Reuben Dubester";
        userEmail = "reuben" + "." + "dubester" + "@" + "gmail.com";

        ignores = [".DS_Store"];

    };

    programs.git.aliases = {
    cl    = "clone";
    gh-cl = "gh-clone";
    p     = "push";
    pl    = "pull";
    f     = "fetch";
    fa    = "fetch --all";
    a     = "add";
    ap    = "add -p";
    d     = "diff";
    dl    = "diff HEAD~ HEAD";
    ds    = "diff --staged";
    l     = "log --show-signature";
    l1    = "log -1";
    lp    = "log -p";
    c     = "commit";
    ca    = "commit --amend";
    co    = "checkout";
    cb    = "checkout -b";
    cm    = "checkout origin/main";
    de    = "checkout --detach";
    fco   = "fetch-checkout";
    br    = "branch";
    s     = "status";
    r     = "rebase";
    rc    = "rebase --continue";
    ri    = "rebase -i";
    m     = "merge";
    t     = "tag";
    su    = "submodule update --init --recursive";
    bi    = "bisect";
    };
}