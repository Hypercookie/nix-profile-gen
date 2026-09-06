{ lib
, python3
, makeWrapper
, stdenvNoCC
, curl
, openssl
,
}:

stdenvNoCC.mkDerivation {
  pname = "nixmagic-mdm";
  version = "0.1.0";

  src = ../cli;

  nativeBuildInputs = [ makeWrapper ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm444 nixmagic_mdm.py $out/libexec/nixmagic_mdm.py

    makeWrapper ${python3}/bin/python3 $out/bin/nixmagic-mdm \
      --add-flags $out/libexec/nixmagic_mdm.py \
      --prefix PATH : ${lib.makeBinPath [ curl openssl ]}

    runHook postInstall
  '';

  meta = {
    description = "Setup and push CLI for the nixmagic local MDM server";
    mainProgram = "nixmagic-mdm";
    platforms = lib.platforms.unix;
  };
}
