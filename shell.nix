{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.python3Packages.pip
  ];

  shellHook = ''
    if [ ! -d .venv ]; then
      python -m venv .venv
    fi
    source .venv/bin/activate

    # Install dploy if not already installed
    if ! pip show dploy >/dev/null 2>&1; then
      pip install git+https://github.com/arecarn/dploy.git
    fi

    echo "Virtual environment activated. 'dploy' should now be available."
  '';
}
