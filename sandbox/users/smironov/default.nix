# This file contains definition of work environment for Nix-systems
# See also http://www.nixos.org/nix
# Use `nix-shell` command may be used to activate the environment

{ pkgs ?  import <nixpkgs> {}
, stdenv ? pkgs.stdenv
} :
let

  be = stdenv.mkDerivation {
    name = "buildenv";
    buildInputs =
      with pkgs;
      with pkgs.python3Packages;
    [
      ctags
      python
      ipython
      numpy
      matplotlib
      git
      jupyter_console
      jupyter
      nbformat
      scipy
      pyqt5
      pandas
      scikitlearn
      hyperopt
    ];

    shellHook = with pkgs; ''
      export MPLBACKEND='Qt5Agg'
      alias ipython='ipython --matplotlib=qt5'
    '';
  };

in
  be

