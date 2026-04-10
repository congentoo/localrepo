# localrepo

Personal Gentoo overlay for miscellaneous packages not in the main tree,
version bumps, divergent versions, and a custom profile.

## Scope

This is the main "catch-all" personal overlay. Narrower-scope packages
have been moved to dedicated overlays:

- [**llvm15**](https://github.com/congentoo/llvm15) — LLVM 15 toolchain
  - legacy Intel GPU OpenCL stack
- [**llvm14**](https://github.com/congentoo/llvm14) — LLVM 14 toolchain
  (sibling of llvm15)

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

## Enabling the overlay

```ini
# /etc/portage/repos.conf/localrepo.conf
[localrepo]
location = /var/db/repos/localrepo
sync-type = git
sync-uri = https://github.com/congentoo/localrepo.git
auto-sync = yes
```

Then: `emerge --sync localrepo`.

## Related overlays

- [llvm15](https://github.com/congentoo/llvm15),
  [llvm14](https://github.com/congentoo/llvm14) (see above)

## Development

See [CONTRIBUTING.md](CONTRIBUTING.md) for the maintenance workflow and
[SECURITY.md](SECURITY.md) for the security policy.
