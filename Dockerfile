FROM ubuntu:18.10
RUN apt update && \
    apt install -y git g++ cmake libboost-dev libboost-thread-dev libboost-test-dev \
    libboost-filesystem-dev libboost-date-time-dev libboost-system-dev libboost-iostreams-dev \
    libboost-program-options-dev libboost-locale-dev libssl-dev libgmp-dev && \
    git clone https://github.com/EOSChronicleProject/eos-chronicle.git && \
    cd eos-chronicle && \
    git checkout v1.1-rc3 && \
    git submodule update --init --recursive && \
    mkdir build && \
    cd build && \
    cmake .. && make -j 10
CMD ["/bin/bash"]