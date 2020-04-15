## Feature Summary

- Google BBR v2alpha
- Built with LLVM-9 Toolchain

## Source Info

#### Source Base:

- Repo: [Linux Stable](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git)
- Tag: v5.4.30
- Commit ID: ad13e142e024aa194016a32de8b9ba058fe9a6af

#### Feature Cherry Picks

1. Repo: [Google BBR](https://github.com/google/bbr)

   Branch: v2alpha

   Commits: `e5fe52d14784df8e08067b2d6a2fa99e01e81a44` ~ `55105fea34f330062943c65d1dc85774f9fd532f`

   Reason: Google BBR v2alpha

#### Patches

1. Repo: [Linux Mainline](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git)

   Commits: [`7273ad2b08f8ac9563579d16a3cf528857b26f49`](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7273ad2b08f8ac9563579d16a3cf528857b26f49)

   Reason: Fix build error when using ld.lld-9

2. Commit: [`f1336f1b7f51edd83ad25730e36f9b6903359f9c`](https://github.com/YanzheL/linux/commit/f1336f1b7f51edd83ad25730e36f9b6903359f9c)

   Reason: Fix cherry-pick conflict

## KConfig

Based on [Ubuntu Mainline kernel v5.4.28](https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.4.28/)

## Compiler Info

#### LLVM toolchain

- clang-9
- ld.lld-9
- llvm-as-9
- llvm-ar-9
- llvm-nm-9
- llvm-size-9
- llvm-strip-9
- llvm-objdump-9
- llvm-objcopy-9
- llvm-readelf-9

## How to reproduce

See `build.sh`
