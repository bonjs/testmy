#!/bin/bash

echo '同步子模块中';
git submodule init;
git submodule sync;
git submodule update;

sh init_submodule_branch.sh
