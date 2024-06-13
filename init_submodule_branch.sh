#!/bin/bash

# 读取.gitmodules文件内容并提取各个子模块的配置信息
root_path=$(pwd);
while IFS= read -r line; do
    if [[ $line == \[submodule* ]]; then
        submodule=$(echo $line | cut -d " " -f2 | sed 's/\]//g' | sed 's/"//g')
        url=$(git config -f .gitmodules --get-regexp "submodule.$submodule.url" | cut -d " " -f2)
        path=$(git config -f .gitmodules --get-regexp "submodule.$submodule.path" | cut -d " " -f2)
        branch=$(git config -f .gitmodules --get-regexp "submodule.$submodule.branch" | cut -d " " -f2)

        echo "URL: $url"
        echo "Path: $path"
        echo "Branch: $branch"

        cd $root_path/$path;
        git checkout $branch;
       # git pull
        cd $root_path
        echo '*********************************************'
    fi
done < .gitmodules
