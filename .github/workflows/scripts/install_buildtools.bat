set CMAKE_VERSION=%1
set NINJA_VERSION=%2
set VCPKG_VERSION=%3

mkdir C:\opt\cmake
cd C:\opt\cmake
curl -SL --output cmake.zip https://github.com/Kitware/CMake/releases/download/v%CMAKE_VERSION%/cmake-%CMAKE_VERSION%-windows-x86_64.zip
tar -xf cmake.zip --strip-components=1
mkdir C:\opt\ninja
cd C:\opt\ninja
curl -SL --output ninja-win.zip https://github.com/ninja-build/ninja/releases/download/v%NINJA_VERSION%/ninja-win.zip
tar -xf ninja-win.zip
mkdir C:\opt\vcpkg
cd C:\opt\vcpkg
curl -SL --output vcpkg.zip https://github.com/microsoft/vcpkg/archive/refs/tags/%VCPKG_VERSION%.zip
tar -xf vcpkg.zip --strip-components=1
bootstrap-vcpkg.bat -disableMetrics
setx PATH "C:\opt\cmake\bin;C:\opt\ninja;C:\opt\vcpkg;%PATH%"
setx VCPKG_ROOT "C:\opt\vcpkg"
