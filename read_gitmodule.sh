#!/bin/bash

# 读取.gitmodules文件内容并提取各个子模块的配置信息
while IFS= read -r line; do
    if [[ $line == \[submodule* ]]; then
        submodule=$(echo $line | cut -d " " -f2 | sed 's/\]//g')
        url=$(git config -f .gitmodules --get-regexp "submodule.$submodule.url" | cut -d " " -f2)
        path=$(git config -f .gitmodules --get-regexp "submodule.$submodule.path" | cut -d " " -f2)
        branch=$(git config -f .gitmodules --get-regexp "submodule.$submodule.branch" | cut -d " " -f2)
        
        echo "Submodule: $submodule"
        echo "URL: $url"
        echo "Path: $path"
        echo "Branch: $branch"
        echo
    fi
done < .gitmodules
