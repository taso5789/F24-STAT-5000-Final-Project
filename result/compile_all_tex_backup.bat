@echo off
REM This batch file compiles all .tex files in the specified folder to PDF.

REM Set the directory where .tex files are located
set TEX_FOLDER=.

REM Change to the specified directory
cd %TEX_FOLDER%

REM Loop through all .tex files in the directory
for %%f in (*.tex) do (
    echo Compiling %%f...
    pdflatex -interaction=nonstopmode %%f
    if errorlevel 1 (
        echo Error while compiling %%f. Check the log file for details.
    ) else (
        echo Successfully compiled %%f to PDF.
    )
)

REM Clean up auxiliary files
echo Cleaning up auxiliary files...
del /q *.aux *.log *.out

echo All .tex files have been processed.
pause
