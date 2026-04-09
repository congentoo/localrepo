# Security Policy

## Scope

This is a **personal Gentoo overlay** for miscellaneous packages. Most
packages are either version bumps of main-tree packages or small utilities
not available in the official Gentoo tree.

## Supported Versions

Only the **latest version of each package** in this overlay receives
updates. Older versions may be kept for rollback.

For upstream security issues, report directly to the upstream project.

## Reporting Issues With the Overlay

For issues specific to the **ebuilds in this overlay** (build failures,
incorrect dependencies, QA issues, wrong version pinning):

- Open a GitHub issue on this repository
- For sensitive issues, use GitHub's private vulnerability reporting feature

## Integrity Guarantees

- All distfiles are verified via BLAKE2B and SHA512 hashes in Manifest files
- CI runs `pkgdev manifest` verification on every PR
- Where upstream provides signatures (GPG/sigstore), `verify-sig` is used

## Supply Chain

- All GitHub Actions are pinned by SHA (via Dependabot updates)
- OSSF Scorecard runs weekly
- CODEOWNERS enforces review for all changes
