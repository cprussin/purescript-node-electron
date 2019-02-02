{
  purescriptVersion ? "0.12.1",
  nixjs ? fetchTarball "https://github.com/cprussin/nixjs/archive/0.0.4.tar.gz",
  nixpkgs ? <nixpkgs>
}:

with import nixpkgs {
  overlays = [
    (import nixjs { purescript = purescriptVersion; })
  ];
};

mkShell {
  buildInputs = [
    git
    nodejs
    yarn
    purescript
  ];
}
