{
  accounts.email.accounts = {
    "TU Wien" = rec {
      address = "e12418032@student.tuwien.ac.at";
      userName = address;
      realName = "Philip Damianik";
      primary = true;

      smtp = {
        host = "smtp-mail.outlook.com";
        port = 587;
        tls = { enable = true; useStartTls = true; };
      };

      imap = {
        host = "outlook.office365.com";
        port = 993;
        tls.enable = true;
      };

      thunderbird = {
        enable = true;
        profiles = [ "default" ];
        settings = id: {
          "mail.server.server_${id}.authMethod" = 10;
          "mail.smtpserver.smtp_${id}.authMethod" = 10;
        };
      };
    };
  };

  programs.thunderbird.profiles = {
    default = {
      isDefault = true;
    };
  };
}
