# Contributing to localrepo

## Development workflow

1. Install required tools:

   ```bash
   emerge --ask dev-util/pkgcheck dev-util/pkgdev dev-vcs/pre-commit
   ```

2. Install pre-commit hooks:

   ```bash
   pre-commit install
   ```

3. Edit ebuilds. When done:

   ```bash
   # Regenerate Manifest for current package
   pkgdev manifest

   # Or all packages in the overlay
   pkgdev manifest -r .
   ```

4. Check for QA issues:

   ```bash
   pkgcheck scan
   ```

5. Commit with `pkgdev commit`:

   ```bash
   pkgdev commit
   ```

## Scope guidelines

This is the "catch-all" personal overlay. Before adding a package here,
consider:

- Is there a more specific overlay? (llvm15, llvm14, aws, etc.)
- Does the main Gentoo tree already have this package at an acceptable version?
- Would a GURU overlay submission be more appropriate?

Only add packages here if they don't fit elsewhere.

## Ebuild guidelines

- Use EAPI 8 for new ebuilds
- Copy from the main Gentoo tree when possible and track it
- If diverging from the tree, document why in the ebuild comments
- Don't reference absolute paths (e.g., `/home/user/...`)
- Keep Manifests generated via `pkgdev manifest`, never hand-edit

## CI checks

Every PR runs:

- **pkgcheck**: Gentoo QA checks
- **manifest**: Verifies Manifest files are up-to-date
- **pre-commit**: Text hygiene, shellcheck, Gentoo-specific hooks

Fix any issues before merging.
