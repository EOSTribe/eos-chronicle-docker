#!/bin/sh
/opt/chronicle-receiver  --data-dir=${DATA_DIR} --config-dir=${DATA_DIR} --mode=${MODE} --host=${HOST} --port=${PORT} --exp-ws-host=${WS_HOST} --exp-ws-port=${WS_PORT} --exp-ws-bin-header=false --plugin=exp_ws_plugin --skip-block-events=${SKIP_BLOCK_EVENTS} --skip-table-deltas=${SKIP_TABLE_DELTAS}