# get LLFI profiling file and remove profiling steps
cp llfi/$1-profiling.ll ./profiled.ll
sed -i '/doProfiling/d' ./profiled.ll
sed -i '/endProfiling/d' ./profiled.ll

# run pass
cp /home/foo/LLFI/installer/llvm/lib/DICount.so .
opt -load ./DICount.so -di_count profiled.ll -o pass.ll

# copy and link external files
cp /home/foo/edc-predictor/DICount_external.ll .
llvm-link pass.ll DICount_external.ll -o linked.ll
llvm-dis linked.ll -o di_count.ll

rm profiled.ll
rm pass.ll
rm linked.ll
rm DICount.so
rm DICount_external.ll