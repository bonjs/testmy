const fs = require('fs');
const ini = require('ini');

// fdsa
// fdfdsfdssc:w
// 读取.gitmodules文件
fs.readFile('.gitmodules', 'utf8', (err, data) => {
    if (err) {
        console.error(err);
        return;
    }

    // 解析.gitmodules内容
    const gitModulesData = ini.parse(data);

    // 将解析后的内容转换为JSON字符串
    const jsonData = JSON.stringify(gitModulesData, null, 2);
    console.log(jsonData)

});
