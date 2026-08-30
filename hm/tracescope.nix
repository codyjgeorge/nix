{ config, pkgs, inputs, ... }:

let
    tracescope-src = pkgs.fetchurl {
        url = "https://github.com/w-cook/tracescope-qt-log-inspector/releases/download/v0.14.0/TraceScope-v0.14.0-linux-x86_64.AppImage";
        sha256 = "278ceaaf46a23e2599d325baec1d24814e1a55ba48fa0ee55d87a99229ab16ff";
    };
in
{
    home.packages = [ 
        (pkgs.appimageTools.wrapType2 {
            pname = "TraceScope";
            name = "tracescope";
            version = "0.14.0";
            src = tracescope-src;
            extraInstallCommands =
                let
                    contents = pkgs.appimageTools.extract {
                        pname = "TraceScope";
                        version = "0.14.0";
                        src = tracescope-src;
                    };
                in
                ''
                    install -m 444 -D ${contents}/tracescope.desktop $out/share/applications/tracescope.desktop
                    cp -r ${contents}/usr/share/icons $out/share/icons

                    mv $out/bin/TraceScope $out/bin/.TraceScope-bin
                    cat > $out/bin/TraceScope <<'EOF'
                    #!/bin/sh
                    export QT_QPA_PLATFORM=xcb
                    exec "$(dirname "$0")/.TraceScope-bin" "$@"
                    EOF
                    chmod +x $out/bin/TraceScope
                '';
        })
    ];
}
