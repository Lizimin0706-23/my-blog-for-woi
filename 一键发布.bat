@echo off
:: 设置字符集为 UTF-8，彻底解决中文乱码问题
chcp 65001 >nul

echo =========================================
echo       wol's Blog 自动发布脚本 (精简版)
echo =========================================
echo.

:: 自动处理换行符转换警告，减少无用信息刷屏
git config core.autocrlf true
git config core.safecrlf false

echo [1/3] 正在扫描 Simply Static 生成的新文件...
git add .

echo.
echo [2/3] 正在打包本地数据...
:: 尝试提交更改，即使没有变化也不会报错中断
git commit -m "Auto Update: %date% %time%"

echo.
echo [3/3] 正在强制推送到 GitHub...
:: 使用 -f 强制推送，直接解决之前遇到的 rejected 冲突问题
git push -f origin main

echo.
echo =========================================
echo   🎉 发布流程执行完毕！
echo   请确认上方显示 "main -> main" 或 "forced update"
echo =========================================
pause