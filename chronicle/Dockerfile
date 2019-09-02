FROM ubuntu:18.10
RUN apt update && \
    apt install -y git g++ cmake libboost-dev libboost-thread-dev libboost-test-dev \
    libboost-filesystem-dev libboost-date-time-dev libboost-system-dev libboost-iostreams-dev \
    libboost-program-options-dev libboost-locale-dev libssl-dev libgmp-dev && \
    git clone https://github.com/EOSChronicleProject/eos-chronicle.git && \
    cd eos-chronicle && \
#    git checkout  origin/nodeos0108 && \
    git submodule update --init --recursive && \
    mkdir build && \
    cd build && \
    cmake .. && make -j 10 && \
    mv chronicle-receiver /opt/ && \
    mkdir /data && \
    rm -rf ~/eos-chronicle
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
WORKDIR  /opt/data
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
#ENTRYPOINT /opt/chronicle-receiver --data-dir=${DATA_DIR} --config-dir=${DATA_DIR} --mode=${MODE} --host=${HOST} --port=${PORT} --exp-ws-host=${WS_HOST} --exp-ws-port=${WS_PORT} --exp-ws-bin-header=false --plugin=exp_ws_plugin --skip-block-events=${SKIP_BLOCK_EVENTS} --skip-table-deltas=${SKIP_TABLE_DELTAS}
