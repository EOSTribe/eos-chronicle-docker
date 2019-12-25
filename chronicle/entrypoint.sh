#!/bin/sh

prep_term()
{
    unset term_child_pid
    unset term_kill_needed
    trap 'handle_term' TERM INT
}

handle_term()
{
    if [ "${term_child_pid}" ]; then
        kill -TERM "${term_child_pid}" 2>/dev/null
    else
        term_kill_needed="yes"
    fi
}

wait_term()
{
    term_child_pid=$!
    if [ "${term_kill_needed}" ]; then
        kill -TERM "${term_child_pid}" 2>/dev/null
    fi
    wait ${term_child_pid}
    trap - TERM INT
    wait ${term_child_pid}
}

# EXAMPLE USAGE
prep_term
/opt/chronicle-receiver  --data-dir=${DATA_DIR} --config-dir=${DATA_DIR} --mode=${MODE} --host=${HOST} --port=${PORT} --exp-ws-host=${WS_HOST} --exp-ws-port=${WS_PORT} --exp-ws-bin-header=${BIN_HEADER} --exp-ws-path=${EXP_WS_PATH} --plugin=exp_ws_plugin --irreversible-only=${IRREVERSIBLE_ONLY} --exp-ws-max-queue=${EXP_WS_MAX_QEUEU} --skip-traces=${SKIP_TRACES} --skip-block-events=${SKIP_BLOCK_EVENTS} --skip-table-deltas=${SKIP_TABLE_DELTAS} &
wait_term
