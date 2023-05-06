{ ... }: {

    programs.git = {
        
        enable = true;
        userName = "Reuben Dubester";
        userEmail = "reuben" + "." + "dubester" + "@" + "gmail.com";

        ignores = [".DS_Store"];

    };

}