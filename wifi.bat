@echo off

:: Dosya yedekleme için tarih ve saat ekleme
set hour=%time:~0,2%
if %hour% lss 10 set hour=0%hour:~1,1%
set datetime=%date:~-4%-%date:~3,2%-%date:~0,2%_%hour%-%time:~3,2%-%time:~6,2%

:: Çıktıyı kaydedeceğimiz dosya (kullanıcı belgeler klasörüne kaydediliyor)
set output_file=%USERPROFILE%\Desktop\wifi_sifreleri_%datetime%.txt

:: Geçici değişkenlerin uzantılı komut istemiyle kullanımı için "enabledelayedexpansion" etkinleştiriliyor
setlocal enabledelayedexpansion

:: WiFi SSID ve şifrelerini listeleme ve dosyaya yazma
echo Kayıtlı WiFi ağları ve şifreleri > "%output_file%"
for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles') do (
    set "ssid=%%a"
    set "ssid=!ssid:~1!"
    for /f "tokens=2 delims=:" %%b in ('netsh wlan show profile name^="!ssid!" key^=clear ^| findstr /i "Key Content"') do (
        set "key=%%b"
        set "key=!key:~1!"
        echo SSID: !ssid! - Şifre: !key! >> "%output_file%"
    )
)

:: İşlem tamamlandı
echo WiFi şifreleri "%output_file%" dosyasına kaydedildi.

pause
