{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.josie = { # make profile
      isDefault = true; # set default
      settings = { # browser settings
        # homepage
        "browser.startup.page" = 3; # restore last session
        "browser.newtabpage.activity-stream.feeds.topsites" = true;   # show shortcuts row
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false; # disable all the other homepage stuff
        "browser.newtabpage.activity-stream.showWeather" = false;
        "browser.newtabpage.activity-stream.feeds.weatherfeed" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.system.showWeather" = false;

        # toolbar
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":["sync-button","send-tab-button"],"unified-extensions-area":["_0d7cafdd-501c-49ca-8ebb-e3341caaa55e_-browser-action","vpn_proton_ch-browser-action","tineye_ideeinc_com-browser-action","_2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c_-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","plasma-browser-integration_kde_org-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","privatebrowsing-button","vertical-spacer","urlbar-container","downloads-button","fxa-toolbar-menu-button","reset-pbm-toolbar-button","unified-extensions-button","sponsorblocker_ajay_app-browser-action","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action","keepassxc-browser_keepassxc_org-browser-action","songsterr-popup-killer_example_com-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["firefox-view-button","tabbrowser-tabs","new-tab-button","alltabs-button"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"seen":["reset-pbm-toolbar-button","developer-button","screenshot-button","sponsorblocker_ajay_app-browser-action","_0d7cafdd-501c-49ca-8ebb-e3341caaa55e_-browser-action","vpn_proton_ch-browser-action","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action","tineye_ideeinc_com-browser-action","_2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c_-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","plasma-browser-integration_kde_org-browser-action","keepassxc-browser_keepassxc_org-browser-action","songsterr-popup-killer_example_com-browser-action"],"dirtyAreaCache":["nav-bar","vertical-tabs","PersonalToolbar","toolbar-menubar","TabsToolbar","unified-extensions-area","widget-overflow-fixed-list"],"currentVersion":24,"newElementCount":3}'';
        "browser.toolbars.bookmarks.visibility" = "always"; # bookmarks bar always visible
        "browser.bookmarks.restore_default_bookmarks" = false; # dont show "import bookmarks" on new device
        "extensions.formautofill.creditCards.enabled" = false; # dont save payment methods
        "extensions.formautofill.addresses.enabled" = false; # or addresses
      };
      search = { # set search engine
        default = "ddg";
        force = true;
      };
    };
  };
}
