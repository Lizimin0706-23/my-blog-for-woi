@echo off
:: 设置字符集为 UTF-8，彻底解决中文乱码问题
chcp 65001 >nul

echo ===================================================
echo             🚀 wol's Blog 自动发布脚本 
echo ===================================================
echo.

:: 1. 自动配置 Clash 代理 (防止 Connection was reset)
echo [1/4] 正在接管网络，配置 Clash 代理 (端口:7890)...
git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy http://127.0.0.1:7890

:: 2. 关闭烦人的 LF/CRLF 换行符警告刷屏
git config core.autocrlf true
git config core.safecrlf false

:: 3. 扫描本地文件变化
echo.
echo [2/4] 正在扫描 Simply Static 生成的新文件...
git add .

:: 4. 提交更改
echo.
echo [3/4] 正在打包本地数据...
git commit -m "Auto Update: %date% %time%"

:: 5. 强制推送 (解决版本冲突和 rejected 报错)
echo.
echo [4/4] 正在强行推送到 GitHub (无视云端冲突)...
git push -f origin main

echo.
echo ===================================================
echo   🎉 脚本执行完毕！
echo   请检查上方是否有 "main -> main" 或 "forced update"
echo   如果有，按下 Ctrl + F5 刷新你的网站即可！
echo ===================================================
pause