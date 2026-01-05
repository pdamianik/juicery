{
  programs.git = {
    signing = {
      key = "0xEF0B83A3B9F43E2D";
      signByDefault = true;
    };
    settings = {
      user = {
        name = "pdamianik";
        email = "39028343+pdamianik@users.noreply.github.com";
      };
      core = {
        autocrlf = "input";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
