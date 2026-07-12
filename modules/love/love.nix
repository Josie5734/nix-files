{ pkgs, ... }:

let
  llsAddons = pkgs.fetchFromGitHub { # download lua language server addons from Github
    owner = "LuaLS";
    repo = "LLS-Addons";
    rev = "main"; 
    hash = "sha256-0Q+sjl2NGqmGGy/xDRHwsE2TIwm135e3ekYccHL7Kcs="; 
  };

  # extract the Love2D part from the addons
  love2dAddon = pkgs.runCommand "love2d-lsp-addon" {} ''
    mkdir -p $out
    cp -r ${llsAddons}/addons/love2d/. $out/
  '';
in
{
  # put the addon files into ~/programming/love/projects/lsp
  home.file."programming/love/projects/lsp".source = love2dAddon; 

  # create the .luarc.json file that is copied to each project to point it to the love2d addons
  home.file."programming/love/projects/.luarc.json".text = ''
    {
      "workspace.library": ["../projects/lsp"],
      "workspace.checkThirdParty": false,
      "runtime.version": "LuaJIT",
      "diagnostics.globals": ["love"]
    }
  '';

  home.packages = with pkgs; [
    lua # make sure lua is installed
    love # install Love2D
  ];
}
