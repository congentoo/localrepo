# localrepo

Personal Gentoo overlay for miscellaneous packages not in the main tree,
version bumps, divergent versions, and a custom profile.

## Scope

This is the main "catch-all" personal overlay. Narrower-scope packages
have been moved to dedicated overlays:

- **llvm15/** — LLVM 15 toolchain + legacy Intel GPU OpenCL stack
- **llvm14/** — LLVM 14 toolchain (sibling of llvm15)
- **aws/** — AWS CRT Python bindings and dependency bumps

Only packages that don't fit into the above live here.

## Packages

| Category    | Packages                                         |
| ----------- | ------------------------------------------------ |
| app-crypt   | bit-babbler (TRNG USB hardware)                  |
| app-office  | upwork (binary RPM repackage, multiple versions) |
| app-text    | doxygen (custom LLVM_COMPAT)                     |
| dev-python  | rye                                              |
| dev-util    | pygount, zk (Go zettelkasten tool)               |
| mail-client | nmh                                              |
| media-gfx   | pix (photo viewer)                               |
| net-irc     | srain                                            |
| sys-power   | dptfxtract                                       |

## Custom profile

`profiles/local/linux/amd64/23.0/split-usr/llvm-hardened-desktop-gnome`
combines three stock Gentoo profiles:

- `default/linux/amd64/23.0/split-usr/hardened/`
- `default/linux/amd64/23.0/split-usr/llvm/`
- `default/linux/amd64/23.0/split-usr/desktop/gnome/`

This provides the LLVM-based toolchain with hardening defaults and GNOME
desktop USE flags.

## Notes

Some packages in this overlay track bleeding-edge or divergent versions
from the main tree. See individual package metadata.xml for details.

## Related overlays

- llvm15, llvm14, aws (see above)
- etc-portage — system portage config (this repo's neighbor)

## Development

See [CONTRIBUTING.md](CONTRIBUTING.md) for the maintenance workflow.
