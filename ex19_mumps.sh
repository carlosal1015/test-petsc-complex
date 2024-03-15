#! /usr/bin/env bash

source /home/gitpod/setup_arch4edu.sh

setup

cd
git clone https://aur.archlinux.org/petsc.git
cd petsc
makepkg --noconfirm -s

# https://gitlab.com/petsc/petsc/-/blob/v3.20.3/src/snes/tutorials/makefile#L94
# export PETSC_DIR=/opt/petsc/linux-c-opt
# export PYTHONPATH=${PETSC_DIR}/lib:${PYTHONPATH}

# cp -R ${PETSC_DIR}/share/petsc/examples ${HOME}
# cd ${HOME}/examples/src/snes/tutorials
# make testex19 #>/dev/null
# make runex19_fieldsplit_mumps

# if [[ -f ex19 && -f output/ex19_fieldsplit_5.out ]]; then
#     echo 'File exists.'
# else
#     echo 'File does not exist.'
# fi
# mpiexec -np 2 ./ex19 -pc_type fieldsplit -pc_fieldsplit_block_size 4 -pc_fieldsplit_type SCHUR -pc_fieldsplit_0_fields 0,1,2 -pc_fieldsplit_1_fields 3 -fieldsplit_0_pc_type lu -fieldsplit_1_pc_type lu -snes_monitor_short -ksp_monitor_short -fieldsplit_0_pc_factor_mat_solver_type mumps -fieldsplit_1_pc_factor_mat_solver_type mumps >ex19_6.tmp 2>&1
# diff ex19_6.tmp output/ex19_fieldsplit_5.out
#cat ex19_6.tmp output/ex19_fieldsplit_5.out
