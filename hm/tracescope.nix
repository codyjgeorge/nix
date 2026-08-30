{ config, pkgs, inputs, ... }:

let
    tracescope = pkgs.appimageTools.wrapType1 {
        name = "tracescope-0.14.0";
        src = pkgs.fetchurl {
            url = "https://github.com/w-cook/tracescope-qt-log-inspector/releases/download/v0.14.0/TraceScope-v0.14.0-linux-x86_64.AppImage";
            sha256 = "278ceaaf46a23e2599d325baec1d24814e1a55ba48fa0ee55d87a99229ab16ff";
        };
    };
in
{
    home.packages = [ tracescope ];
}
