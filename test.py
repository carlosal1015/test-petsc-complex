# https://gitlab.com/petsc/petsc/-/issues/1149

from petsc4py import PETSc
import gc
petsc_options = {"ksp_type": "preonly", "pc_type": "lu", "pc_factor_mat_solver_type": "mumps",
                 "petsc_options_left": None}


def add_options(prefix, petsc_options):
    opts = PETSc.Options()
    opts.prefixPush(prefix)
    for k, v in petsc_options.items():
        opts[k] = v
    opts.prefixPop()
    opts.clear()
    opts.destroy()
    opts.view()
    del opts
    gc.collect()


num_runs = 2
for i in range(num_runs):
    add_options(f"opts_{i}", petsc_options)
