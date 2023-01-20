set NINJA_VERSION=%1
set VCPKG_VERSION=%2

mkdir C:\opt\ninja
cd C:\opt\ninja
curl -SL --output ninja-win.zip https://github.com/ninja-build/ninja/releases/download/v%NINJA_VERSION%/ninja-win.zip --retry 5 --retry-delay 5
tar -xf ninja-win.zip
mkdir C:\opt\vcpkg
cd C:\opt\vcpkg
curl -SL --output vcpkg.zip https://github.com/microsoft/vcpkg/archive/refs/tags/%VCPKG_VERSION%.zip --retry 5 --retry-delay 5
tar -xf vcpkg.zip --strip-components=1
bootstrap-vcpkg.bat -disableMetrics

setx PATH "C:\opt\cmake\bin;C:\opt\ninja;C:\opt\vcpkg;%PATH%"
setx VCPKG_ROOT "C:\opt\vcpkg"
