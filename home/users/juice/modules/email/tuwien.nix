{
  accounts.email.accounts = {
    tuwien = {
      address = "e12418032@student.tuwien.ac.at";
      name = "TU Wien";
      realName = "Philip Damianik";
      primary = true;
      # thunderbird = {
      #   enable = true;
      # };
    };
  };

  programs.thunderbird.profiles = {
    tuwien = {
      isDefault = true;
    };
  };
}
