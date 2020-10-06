module purge
module load GCCcore/6.4.0
module load hwloc/1.11.7
module load icc/2017.4.196-GCC-6.4.0-2.28  OpenMPI/2.1.1
module load Ambertools/18.10

cpptraj -p int.pdb -y int.pdb -x intimin.pdb
tleap -s -f tleap.in > tleap.out
