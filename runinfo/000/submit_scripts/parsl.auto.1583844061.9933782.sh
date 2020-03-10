
export CORES=$(getconf _NPROCESSORS_ONLN)
echo "Found cores : $CORES"
WORKERCOUNT=1

CMD ( ) {
process_worker_pool.py   -p 0 -c 1 -m None --poll 10 --task_url=tcp://127.0.0.1:54303 --result_url=tcp://127.0.0.1:54293 --logdir=/Users/sohit/Desktop/parallel_patterns/runinfo/000/htex_local --block_id=68 --hb_period=30 --hb_threshold=120 
}
for COUNT in $(seq 1 1 $WORKERCOUNT)
do
    echo "Launching worker: $COUNT"
    CMD &
done
wait
echo "All workers done"
