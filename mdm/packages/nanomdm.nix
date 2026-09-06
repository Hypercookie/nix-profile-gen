{ lib
, buildGoModule
, fetchFromGitHub
,
}:

let
  version = "0.9.0";
in
buildGoModule {
  pname = "nanomdm";
  inherit version;

  src = fetchFromGitHub {
    owner = "micromdm";
    repo = "nanomdm";
    rev = "v${version}";
    hash = "sha256-XngjhSX8GW9Qx4ggsQVLREfDyA2D2rIUqiPI8NqUfj0=";
  };

  vendorHash = "sha256-W49woVx8MjNZsfGHPudYReTRggnjfZ4f3VKCwgqaaV0=";

  subPackages = [
    "cmd/nanomdm"
    "cmd/nano2nano"
  ];

  ldflags = [
    "-s"
    "-w"
    "-X main.version=${version}"
  ];

  meta = {
    description = "Minimalist Apple MDM server and library";
    homepage = "https://github.com/micromdm/nanomdm";
    license = lib.licenses.mit;
    mainProgram = "nanomdm";
    platforms = lib.platforms.unix;
  };
}
