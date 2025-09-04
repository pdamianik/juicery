{
  programs.git = {
    signing = {
      key = "0xEF0B83A3B9F43E2D";
      signByDefault = true;
    };
    userName = "pdamianik";
    userEmail = "39028343+pdamianik@users.noreply.github.com";
    extraConfig = {
      core = {
        autocrlf = "input";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
