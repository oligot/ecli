setlocal
set cwd=%cd%

call "C:\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"

cd %ECLI%
geant compile_libs

cd %cwd%
