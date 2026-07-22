{ pkgs, ... }:

{
  programs.keepassxc = {
    enable = true;
    settings = {
      General = {
        AutoGeneratePasswordForNewEntries = true;
        ConfigVersion = 2;
        URLDoubleClickAction = 2;
      };
      Browser = {
        Enabled = true;
      };
      GUI = {
        ApplicationTheme = "dark";
        HidePreviewPanel = true;
        TrayIconAppearance = "monochrome-light";
      };
      PasswordGenerator = {
        Length = 16;
      };
      Security = {
        EnableCopyOnDoubleClick = true;
      };
    };
  };
}
