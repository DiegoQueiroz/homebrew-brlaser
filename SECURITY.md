# Security Policy

## Supported Versions

This is a Homebrew formula repository for **brlaser** (open-source CUPS driver for monochrome Brother laser printers).

As this repo only contains the Homebrew formula (packaging metadata), "supported" versions correspond to upstream versions installed by the formula.

| Formula Version | Upstream Version | Status |
|----------------|------------------|--------|
| Latest (HEAD)  | 6.x              | ✅ Supported |

## Reporting a Vulnerability

### Vulnerabilities in the Upstream Code (brlaser)

This repository is only a packaging mirror for Homebrew. The actual driver source code is maintained at:

**Original upstream:** https://github.com/pdewacht/brlaser  
**Actively maintained fork:** https://github.com/Owl-Maintain/brlaser

If you discover a security vulnerability in the **brlaser** driver itself, please report directly to the upstream repositories:

1. **GitHub Security Advisories** (preferred): Use the "Security" tab → "Report a vulnerability" on the Owl-Maintain/brlaser repo
2. **Maintainer email:** Check `AUTHORS` or `MAINTAINERS` in the upstream repo for direct contacts

### Vulnerabilities in the Homebrew Formula

If the vulnerability is in the formula itself (e.g., incorrect checksum verification, improperly declared dependencies, insecure installation):

1. Open an **Issue** in this repo with the `security` label
2. Or email the formula maintainer (see `MAINTAINERS` or commit history)

## Response Process

1. **Acknowledgment:** We will respond within 7 business days confirming receipt
2. **Triage:** We will assess whether the vulnerability affects the formula, upstream, or both
3. **Coordination:** If upstream, we will coordinate with the brlaser maintainers
4. **Fix:** We will publish a corrected formula version as soon as possible
5. **Disclosure:** We follow responsible disclosure — technical details only after a fix is available

## Security Updates

- Upstream security updates are incorporated via `brew upgrade brlaser` when a new formula version is published
- We recommend keeping Homebrew updated: `brew update && brew upgrade`

## Scope

This policy covers only:
- The Homebrew formula (`brlaser.rb`)
- Installation/verification scripts in this repository

**Does NOT cover** the C++ source code of the brlaser driver — for that, consult the upstream repo's security policy.

## Acknowledgments

We thank security researchers who report vulnerabilities responsibly. Contributors will be credited in release notes (unless anonymity is preferred).
