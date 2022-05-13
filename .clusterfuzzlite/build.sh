
# Rename to avoid the following: https://github.com/tensorflow/tensorflow/issues/40182
mv $SRC/tensorflow/tensorflow $SRC/tensorflow/tensorflow_src

# Build fuzzers into $OUT. These could be detected in other ways.

for fuzzer in $(find $SRC -name '*_fuzzer.py'); do
  fuzzer_basename=$(basename -s .py $fuzzer)
  fuzzer_package=${fuzzer_basename}.pkg

  pyinstaller --distpath $OUT --onefile --name $fuzzer_package $fuzzer

  echo "#!/bin/sh
# LLVMFuzzerTestOneInput for fuzzer detection.
this_dir=\$(dirname \"\$0\")

LD_PRELOAD=ASAN_OPTIONS=\$ASAN_OPTIONS:symbolize=1:external_symbolizer_path=\$this_dir/llvm-symbolizer:detect_leaks=0 \
\$this_dir/$fuzzer_package \$@" > $OUT/$fuzzer_basename
  chmod +x $OUT/$fuzzer_basename
done
mv $SRC/tensorflow/tensorflow_src $SRC/tensorflow/tensorflow
