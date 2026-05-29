@echo off
chcp 65001 >nul
echo Killing existing processes...
taskkill /F /IM lualatex.exe /T >nul 2>&1
taskkill /F /IM bibtex.exe /T >nul 2>&1
taskkill /F /IM xelatex.exe /T >nul 2>&1
taskkill /F /IM latexmk.exe /T >nul 2>&1

echo Cleaning auxiliary files...
del /Q main.aux main.log main.pdf main.toc main.out main.blg main.bbl main.lof main.lot main.synctex.gz 2>nul

echo Running XeLaTeX (Pass 1)...
xelatex -synctex=1 -interaction=nonstopmode -file-line-error main.tex

echo Running BibTeX...
bibtex main

echo Running XeLaTeX (Pass 2)...
xelatex -synctex=1 -interaction=nonstopmode -file-line-error main.tex

echo Running XeLaTeX (Pass 3)...
xelatex -synctex=1 -interaction=nonstopmode -file-line-error main.tex

echo Cleaning auxiliary files after build...
del /Q main.aux main.log main.toc main.out main.blg main.bbl main.lof main.lot main.synctex.gz 2>nul

echo.
echo Build complete. Please check main.pdf.
pause
