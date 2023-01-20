set BASEKIT_ID=%1
set BASEKIT_NAME=%2
set HPCKIT_ID=%3
set HPCKIT_NAME=%4

curl -SL --output oneapi_basekit.exe https://registrationcenter-download.intel.com/akdlm/IRC_NAS/%BASEKIT_ID%/%BASEKIT_NAME%.exe
curl -SL --output oneapi_hpckit.exe https://registrationcenter-download.intel.com/akdlm/IRC_NAS/%HPCKIT_ID%/%HPCKIT_NAME%.exe
oneapi_basekit.exe --silent --extract-only --extract-folder basekit_extracted
basekit_extracted\bootstrapper.exe --silent --eula=accept --action=install --components=intel.oneapi.win.dpcpp_ct.common:intel.oneapi.win.dpcpp_debugger:intel.oneapi.win.dpl:intel.oneapi.win.tbb.devel:intel.oneapi.win.dpcpp-compiler:intel.oneapi.win.mkl.devel -p=NEED_VS2017_INTEGRATION=0 -p=NEED_VS2019_INTEGRATION=0 -p=NEED_VS2022_INTEGRATION=0
oneapi_hpckit.exe --silent --extract-only --extract-folder hpckit_extracted
hpckit_extracted\bootstrapper.exe --silent --eula=accept --action=install --components=intel.oneapi.win.cpp-compiler:intel.oneapi.win.ifort-compiler:intel.oneapi.win.mpi.devel -p=NEED_VS2017_INTEGRATION=0 -p=NEED_VS2019_INTEGRATION=0 -p=NEED_VS2022_INTEGRATION=0
