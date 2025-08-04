{ pkgs, ... }:
pkgs.mkShell {
  packages = [
    pkgs.vlang
    pkgs.jetbrains.clion
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.clion [
      pkgs.jetbrains.plugins.github-copilot-fixed
      "ideavim"
      "string-manipulation"
      "wakatime"
      "gittoolbox"
      "key-promoter-x"
      "randomness"
      "csv-editor"
      "rainbow-brackets"
      "developer-tools"
      "-env-files"

      (pkgs.fetchurl { # "vlang"
        url = https://plugins.jetbrains.com/files/24183/728813/IntelliJ_V-2025.1.1.zip;
        sha256 = "sha256-rHTYS+tj7JxcK6cTA6VK3K4Yq+71RuRS7zgUSkmkdDU=";
      })
      (pkgs.fetchurl { # "foldable-project-view"
        url = "https://plugins.jetbrains.com/files/17288/638325/Foldable_Project_View-2.0.0.zip";
        sha256 = "sha256-zBFqPUXPZSI/dvxlY2mbQcn0CXLraBlgbb4qlMq/pOQ=";
      })
      (pkgs.fetchurl { # "grazie-pro"
        url = "https://plugins.jetbrains.com/files/16136/813770/grazie-pro-0.3.388-251.zip";
        sha256 = "sha256-ZnLRYx1abi5DaWJIXU8ksplLGaTfTQiAXAWLO3YFeLM=";
      })
    ])
  ];
  shellHook = ''
    echo "V dev environment loaded."
  '';
}
