{
  purescript-version ? "0.12.2",
  nixjs-version ? "0.0.6",
  nixjs ? fetchTarball "https://github.com/cprussin/nixjs/archive/${nixjs-version}.tar.gz",
  nixpkgs ? <nixpkgs>
}:

let
  nixjs-overlay = import nixjs { purescript = purescript-version; };
  nixpkgs' = import nixpkgs { overlays = [ nixjs-overlay ]; };
in

with nixpkgs';

mkShell {
  buildInputs = [
    git
    nodejs
    yarn
    purescript
  ];
}
