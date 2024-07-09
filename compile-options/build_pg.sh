#!/bin/zsh
branch="REL_17_STABLE"

if [[ ! -d "postgres" ]]; then
  git clone -b "$branch" git@github.com:postgres/postgres.git --depth 1
fi

cd postgres

if [[ ! -d "build" ]]; then
  mkdir build
fi

curr_build_path=$(pwd)/build
build_opts=--with-llvm --enable-dtrace --enable-debug --enable-cassert

# build
if [[ "$(uname)" == "Darwin" ]]; then
  # mac
  bear -- ./configure --prefix=$curr_build_path $build_opts
  bear -- make -j 10 -s
elif [[ "$(uname -s)" == "Linux" ]]; then   
  # Linux
  bear ./configure --prefix=$curr_build_path $build_opts
  bear make -j 10 -s
else
  echo "unsupport current system $(uname)"
  exit 1
fi

make install

if [[ $? != 0 ]]; then
  echo "make failed"
  exit 1
fi

cd build
# initdb and start
./bin/pg_ctl -D "$curr_build_path"/data -l logfile initdb
./bin/pg_ctl -D "$curr_build_path"/data -l logfile start
