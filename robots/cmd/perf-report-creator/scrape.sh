CREDENTIALS_FILE=${1}
BENCHMARKS_DIR=${2}
OUTPUT_DIR=${3:-output}

# scrape sig-performance 1.27 results
perf-report-creator results --credentials-file=${CREDENTIALS_FILE} --output-dir ${OUTPUT_DIR}/results --since 1200h0s --performance-job-name periodic-kubevirt-e2e-k8s-1.27-sig-performance
# scrape 100 density test results
perf-report-creator results --credentials-file=${CREDENTIALS_FILE} --output-dir ${OUTPUT_DIR}/results --since 1200h0s --performance-job-name periodic-kubevirt-performance-cluster-100-density-test

# aggregate sig-performance 1.27 results in weekly directory
perf-report-creator weekly-report --output-dir=${OUTPUT_DIR}/weekly/periodic-kubevirt-e2e-k8s-1.27-sig-performance \
  --results-dir=${OUTPUT_DIR}/results/periodic-kubevirt-e2e-k8s-1.27-sig-performance \
  --vmi-metrics-list=vmiCreationToRunningSecondsP50,vmiCreationToRunningSecondsP95,LIST-virtualmachineinstances-count,LIST-pods-count,LIST-nodes-count,LIST-virtualmachineinstancemigrations-count,LIST-endpoints-count,GET-virtualmachineinstances-count,GET-pods-count,GET-nodes-count,GET-virtualmachineinstancemigrations-count,GET-endpoints-count,CREATE-virtualmachineinstances-count,CREATE-pods-count,CREATE-nodes-count,CREATE-virtualmachineinstancemigrations-count,CREATE-endpoints-count,PATCH-virtualmachineinstances-count,PATCH-pods-count,PATCH-nodes-count,PATCH-virtualmachineinstancemigrations-count,PATCH-endpoints-count,UPDATE-virtualmachineinstances-count,UPDATE-pods-count,UPDATE-nodes-count,UPDATE-virtualmachineinstancemigrations-count,UPDATE-endpoints-count \
  --vm-metrics-list vmiCreationToRunningSecondsP50,vmiCreationToRunningSecondsP95,LIST-virtualmachineinstances-count,LIST-pods-count,LIST-nodes-count,LIST-virtualmachineinstancemigrations-count,LIST-endpoints-count,GET-virtualmachineinstances-count,GET-pods-count,GET-nodes-count,GET-virtualmachineinstancemigrations-count,GET-endpoints-count,CREATE-virtualmachineinstances-count,CREATE-pods-count,CREATE-nodes-count,CREATE-virtualmachineinstancemigrations-count,CREATE-endpoints-count,PATCH-virtualmachineinstances-count,PATCH-pods-count,PATCH-nodes-count,PATCH-virtualmachineinstancemigrations-count,PATCH-endpoints-count,UPDATE-virtualmachineinstances-count,UPDATE-pods-count,UPDATE-nodes-count,UPDATE-virtualmachineinstancemigrations-count,UPDATE-endpoints-count

# aggregate 100-density-test results
perf-report-creator weekly-report --output-dir=${OUTPUT_DIR}/weekly/periodic-kubevirt-performance-cluster-100-density-test \
  --results-dir=${OUTPUT_DIR}/results/periodic-kubevirt-performance-cluster-100-density-test \
  --vmi-metrics-list=vmiCreationToRunningSecondsP50,vmiCreationToRunningSecondsP95,LIST-virtualmachineinstances-count,LIST-pods-count,LIST-nodes-count,LIST-virtualmachineinstancemigrations-count,LIST-endpoints-count,GET-virtualmachineinstances-count,GET-pods-count,GET-nodes-count,GET-virtualmachineinstancemigrations-count,GET-endpoints-count,CREATE-virtualmachineinstances-count,CREATE-pods-count,CREATE-nodes-count,CREATE-virtualmachineinstancemigrations-count,CREATE-endpoints-count,PATCH-virtualmachineinstances-count,PATCH-pods-count,PATCH-nodes-count,PATCH-virtualmachineinstancemigrations-count,PATCH-endpoints-count,UPDATE-virtualmachineinstances-count,UPDATE-pods-count,UPDATE-nodes-count,UPDATE-virtualmachineinstancemigrations-count,UPDATE-endpoints-count \

#cp -ru ${OUTPUT_DIR}/* ${BENCHMARKS_DIR}
