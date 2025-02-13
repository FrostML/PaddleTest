model_item=CE_gpt_stage2
dp_degree=1
mp_degree=1
pp_degree=1
bs_item=16
fp_item=fp16
run_mode=DP1-MP1-PP1
device_num=N1C2
max_iter=20000
use_sharding=True
use_recompute=True
sharding_stage=2
sharding_offload=True
eval_freq=20000
sharding_degree=2

model=gpt
micro_bs=8

cd ./benchmarks
bash ./test_tipc/gpt/dygraph/hybrid_parallel/benchmark_common/prepare.sh
# run
bash ./test_tipc/gpt/dygraph/hybrid_parallel/benchmark_common/run_benchmark.sh ${model_item} ${fp_item} ${dp_degree} ${mp_degree} ${pp_degree} ${micro_bs} ${bs_item} ${run_mode} ${device_num} \
    ${max_iter} ${use_sharding} ${use_recompute} ${sharding_stage} ${sharding_offload} ${eval_freq} ${sharding_degree} 2>&1;
