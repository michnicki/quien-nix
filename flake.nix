{
  description = "A better WHOIS lookup tool with interactive TUI";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    src = {
      url = "github:retlehs/quien/v0.11.0";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, src }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        version = "0.11.0";
      in
      {
        packages.default = pkgs.buildGoModule {
          pname = "quien";
          inherit version src;

          vendorHash = "sha256-/uizVtnbjkm4CTVxLECFeqBsBEue5vb7QALA+RbLmSc=";

          ldflags = [
            "-s"
            "-w"
            "-X main.version=${version}"
            "-X main.commit=unknown"
            "-X main.date=unknown"
          ];

          env.CGO_ENABLED = 0;

          meta = with pkgs.lib; {
            description = "A better WHOIS lookup tool with interactive TUI";
            homepage = "https://github.com/retlehs/quien";
            license = licenses.mit;
            maintainers = [ ];
            mainProgram = "quien";
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go
            gopls
            gotools
            go-tools
          ];
        };
      });
}
