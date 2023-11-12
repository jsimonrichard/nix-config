# My NixOS Configuration

**Usage:**

```bash
nixos-rebuild --flake .#hostname
```

To update flake inputs:
```bash
nix flake lock --update-input <input>
```

To install on a new system, follow this guide: https://openzfs.github.io/openzfs-docs/Getting%20Started/NixOS/Root%20on%20ZFS.html

Also, to enable automatic snapshots run this command.
```bash
zfs set com.sun:auto-snapshot=true <pool>/<fs>
```

To build the installer, run
```bash
nix build .#nixosConfigurations.installer.config.system.build.isoImage
```

## Features

- Coming soon...

## Acknowledgements

Shout out to Misterio77 for the great starter repo: https://github.com/Misterio77/nix-starter-configs

Also, this book was helpful: https://nixos-and-flakes.thiscute.world/.