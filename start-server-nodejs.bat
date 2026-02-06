@echo off
chcp 65001 >nul
title نظام إدارة الجمعية الخيرية (Node.js)
color 0B

echo.
echo ══════════════════════════════════════════════════════════════
echo              🤲 نظام إدارة الجمعية الخيرية 🤲
echo                    (Node.js Server)
echo ══════════════════════════════════════════════════════════════
echo.

:: Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ خطأ: Node.js غير مثبت على هذا الجهاز!
    echo.
    echo 📥 الرجاء تحميل Node.js من:
    echo    https://nodejs.org/
    echo.
    pause
    exit /b 1
)

:: Check if http-server is installed
where http-server >nul 2>&1
if errorlevel 1 (
    echo 📦 جاري تثبيت http-server...
    echo.
    npm install -g http-server
    echo.
    echo ✅ تم التثبيت بنجاح!
    echo.
)

:: Get IP Address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do set IP=%%a
set IP=%IP:~1%

echo ══════════════════════════════════════════════════════════════
echo                    ✅ السيرفر يعمل الآن!
echo ══════════════════════════════════════════════════════════════
echo.
echo 💻 للوصول من هذا الجهاز:
echo    ┌─────────────────────────────────┐
echo    │  http://localhost:8080          │
echo    └─────────────────────────────────┘
echo.
echo 📱 للوصول من الأجهزة الأخرى على نفس الشبكة:
echo    ┌─────────────────────────────────┐
echo    │  http://%IP%:8080
echo    └─────────────────────────────────┘
echo.
echo 💡 سيفتح المتصفح تلقائياً
echo ══════════════════════════════════════════════════════════════
echo.

:: Start the server
http-server -p 8080 -o -c-1

pause
