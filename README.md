# [Arch Linux PETSc complex scalar's conclusions](https://aur.archlinux.org/packages/petsc-complex)

## [`triangle`](https://aur.archlinux.org/packages/triangle)

In order to use `triangle` mesh generator, the user could face this follow situations:

| Is installed ... compilation? | `triangle` | feature `triangle` status | `petsc-complex` status |
| :---------------------------- | :--------: | :-----------------------: | :--------------------: |
| before (`automagicdepends`)   |   _Yes_    |            ✅             |           ✅           |
| between (`makedepends`)       |   _Yes_    |            ❌             |           ✅           |
| after (`optdepends`)          |    _No_    |            ✅             |           ✅           |

**Therefore, `triangle` is a `makedepends` and an `optdepends`, but not an `automagicdepends`**.

> Side note:
>
> - `optdepends` means that `petsc-complex` is working fine, but if user requires a `foo-package` feature only must install it after installation (`python` bindings).
> - `makedepends` means that `petsc-complex` is working fine and the `foo-package` is no longer required anymore (e.g. `cmake`)
> - [`automagicdepends`](https://wiki.gentoo.org/wiki/Project:Quality_Assurance/Automagic_dependencies) (e.g.`openmpi`).
