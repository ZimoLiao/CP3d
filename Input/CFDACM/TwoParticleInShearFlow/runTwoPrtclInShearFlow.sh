#!/bin/bash
cmpStr="gcc"
appStr="mpirun"
p_row=4
p_col=2
if [[ -n $1 ]]; then
  cmpStr=$1
fi
if [[ -n $2 ]]; then
  appStr=$2
fi
if [[ -n $3 ]]; then
  p_row=$3
fi
if [[ -n $4 ]]; then
  p_col=$4
fi
let nproc=p_row*p_col

cd ../../../
chmod a+x mymake.sh
mkdir -p ./ACM/Restart/ 2> /dev/null

# Re=0.1
cp ./Input/CFDACM/TwoParticleInShearFlow/SpheresCoord.Case1 ./ACM/Restart/SpheresCoord.dat
./mymake.sh -exe-channelACM -cmp-"$cmpStr"_MPI -CompileThirdParty-0 -deleteCompileFile-1 -CFD_DEFS_Add -ACM_DEFS_Add-DRotateOnly -CFDACM_DEFS_Add-DSeveralSphereInfo
$appStr -n $nproc ./channelACM ./Input/CFDACM/TwoParticleInShearFlow/TwoPrclShearCase1.cfd0 ./Input/CFDACM/TwoParticleInShearFlow/TwoPrtclShear.acm0 $p_row $p_col

./mymake.sh -exe-channelACM -cmp-"$cmpStr"_MPI -CompileThirdParty-0 -deleteCompileFile-1 -CFD_DEFS_Add -ACM_DEFS_Add -CFDACM_DEFS_Add-DSeveralSphereInfo
$appStr -n $nproc ./channelACM ./Input/CFDACM/TwoParticleInShearFlow/TwoPrclShearCase1.cfd1 ./Input/CFDACM/TwoParticleInShearFlow/TwoPrtclShear.acm1 $p_row $p_col


# Re=0.2
cp ./Input/CFDACM/TwoParticleInShearFlow/SpheresCoord.Case2 ./ACM/Restart/SpheresCoord.dat
./mymake.sh -exe-channelACM -cmp-"$cmpStr"_MPI -CompileThirdParty-0 -deleteCompileFile-1 -CFD_DEFS_Add -ACM_DEFS_Add-DRotateOnly -CFDACM_DEFS_Add-DSeveralSphereInfo
$appStr -n $nproc ./channelACM ./Input/CFDACM/TwoParticleInShearFlow/TwoPrclShearCase2.cfd0 ./Input/CFDACM/TwoParticleInShearFlow/TwoPrtclShear.acm0 $p_row $p_col

./mymake.sh -exe-channelACM -cmp-"$cmpStr"_MPI -CompileThirdParty-0 -deleteCompileFile-1 -CFD_DEFS_Add -ACM_DEFS_Add -CFDACM_DEFS_Add-DSeveralSphereInfo
$appStr -n $nproc ./channelACM ./Input/CFDACM/TwoParticleInShearFlow/TwoPrclShearCase2.cfd1 ./Input/CFDACM/TwoParticleInShearFlow/TwoPrtclShear.acm1 $p_row $p_col
