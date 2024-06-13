#!/bin/bash

husky install

git submodule init;
git submodule sync;
git submodule update;
sh init_submodule_branch.sh
