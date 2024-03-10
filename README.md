# [Arch Linux PETSc complex scalar's conclusions](https://aur.archlinux.org/packages/petsc-complex)

## [`triangle`](https://aur.archlinux.org/packages/triangle)

In order to use `triangle` mesh generator, the user could face this follow situations:

| `triangle` was installed ... compilation | feature `triangle` for `petsc-complex` status | `petsc-complex` status |
| :--------------------------------------- | :-------------------------------------------: | :--------------------: |
| before (`automagicdepends`)              |                       ✅                       |           ✅            |
| between (`makedepends`)                  |                       ❌                       |           ✅            |
| after (`optdepends`)                     |                       ❌                       |           ✅            |

**Therefore, `triangle` is a `makedepends` and an `optdepends`, but not an `automagicdepends`**.

## [`hdf5-openmpi`](https://archlinux.org/packages/community/x86_64/hdf5-openmpi)

In order to use `hdf5-openmpi` file format, the user could face this follow situations:

| `hdf5-openmpi` was installed ... compilation | feature `hdf5-openmpi` for `petsc-complex` status | `petsc-complex` status |
| :------------------------------------------- | :-----------------------------------------------: | :--------------------: |
| before (`automagicdepends`)                  |                                                   |           ✅            |
| between (`makedepends`)                      |                                                   |           ✅            |
| after (`optdepends`)                         |                                                   |           ✅            |

<!-- **Therefore, `hdf5-openmpi` is a `makedepends` and an `optdepends`, but not an `automagicdepends`**. -->

## [`p4est-deal-ii`](https://aur.archlinux.org/packages/p4est-deal-ii)

In order to use `p4est-deal-ii` for manage forest of octrees, the user could face this follow situations:

| `p4est-deal-ii` was installed ... compilation | feature `p4est-deal-ii` for `petsc-complex` status | `petsc-complex` status |
| :-------------------------------------------- | :------------------------------------------------: | :--------------------: |
| before (`automagicdepends`)                   |                                                    |           ✅            |
| between (`makedepends`)                       |                                                    |           ✅            |
| after (`optdepends`)                          |                                                    |           ✅            |

<!-- **Therefore, `p4est-deal-ii` is a `makedepends` and an `optdepends`, but not an `automagicdepends`**. -->

> Side note:
>
> - `optdepends` means that `petsc-complex` is working fine, but if user requires a `foo-package` feature only must install it after installation (e.g. `python` bindings).
> - `makedepends` means that `petsc-complex` is working fine and the `foo-package` is no longer required anymore (e.g. `cmake`)
> - [`automagicdepends`](https://wiki.gentoo.org/wiki/Project:Quality_Assurance/Automagic_dependencies) (e.g. `openmpi`).
