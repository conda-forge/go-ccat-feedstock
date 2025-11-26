@echo on
@setlocal EnableDelayedExpansion

set GOPROXY=https://proxy.golang.org || goto :error
go mod init || goto :error
go mod tidy || goto :error
go build -o=%LIBRARY_PREFIX%\bin\ccat.exe -ldflags="-s" || goto :error
go-licenses save . --save_path=license-files || goto :error

goto :eof

:error
echo Failed with error #%errorlevel%.
exit 1
