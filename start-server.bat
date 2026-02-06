@echo off
chcp 65001 >nul
title نظام إدارة الجمعية الخيرية
color 0A

echo.
echo ══════════════════════════════════════════════════════════════
echo              🤲 نظام إدارة الجمعية الخيرية 🤲
echo ══════════════════════════════════════════════════════════════
echo.
echo جاري تشغيل السيرفر المحلي...
echo.

:: Get IP Address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do set IP=%%a
set IP=%IP:~1%

echo ══════════════════════════════════════════════════════════════
echo                    ✅ السيرفر يعمل الآن!
echo ══════════════════════════════════════════════════════════════
echo.
echo 💻 للوصول من هذا الجهاز:
echo    ┌─────────────────────────────────┐
echo    │  http://localhost:8000          │
echo    └─────────────────────────────────┘
echo.
echo 📱 للوصول من الأجهزة الأخرى على نفس الشبكة:
echo    ┌─────────────────────────────────┐
echo    │  http://%IP%:8000
echo    └─────────────────────────────────┘
echo.
echo 💡 تأكد من اتصال الأجهزة الأخرى بنفس شبكة WiFi
echo.
echo ⚠️  لإيقاف السيرفر، اضغط Ctrl+C
echo ══════════════════════════════════════════════════════════════
echo.

:: Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ خطأ: Python غير مثبت على هذا الجهاز!
    echo.
    echo 📥 الرجاء تحميل Python من:
    echo    https://www.python.org/downloads/
    echo.
    echo 💡 تأكد من اختيار "Add Python to PATH" أثناء التثبيت
    echo.
    pause
    exit /b 1
)

:: Start the server
echo بدء خدمة HTTP...
echo.
python -m http.server 8000

pause
