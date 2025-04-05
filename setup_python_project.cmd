@echo off
setlocal enabledelayedexpansion

echo ===== Python Project Setup =====

REM Check if project name is provided
if "%~1"=="" (
    echo ERROR: Project name is required.
    echo Usage: setup_python_project.cmd project_name
    exit /b 1
)

set PROJECT_NAME=%~1
set PROJECT_DIR=%CD%\%PROJECT_NAME%

REM Check if project directory already exists
if exist "%PROJECT_DIR%" (
    echo ERROR: Directory "%PROJECT_NAME%" already exists.
    echo Please choose a different project name or delete the existing directory.
    exit /b 1
)

echo Creating Python project: %PROJECT_NAME%

REM Create project directory structure
echo Creating directory structure...
mkdir "%PROJECT_DIR%"
mkdir "%PROJECT_DIR%\%PROJECT_NAME%"
mkdir "%PROJECT_DIR%\tests"
mkdir "%PROJECT_DIR%\docs"

REM Create virtual environment
echo Creating virtual environment...
python -m venv "%PROJECT_DIR%\venv"
if %ERRORLEVEL% neq 0 (
    echo ERROR: Failed to create virtual environment.
    echo Make sure Python is installed and in your PATH.
    exit /b 1
)

REM Create setup.py
echo Creating setup.py...
echo from setuptools import setup, find_packages > "%PROJECT_DIR%\setup.py"
echo. >> "%PROJECT_DIR%\setup.py"
echo setup( >> "%PROJECT_DIR%\setup.py"
echo     name="%PROJECT_NAME%", >> "%PROJECT_DIR%\setup.py"
echo     version="0.1.0", >> "%PROJECT_DIR%\setup.py"
echo     packages=find_packages^(^), >> "%PROJECT_DIR%\setup.py"
echo     install_requires=[ >> "%PROJECT_DIR%\setup.py"
echo         # Add your dependencies here >> "%PROJECT_DIR%\setup.py"
echo     ], >> "%PROJECT_DIR%\setup.py"
echo     author="Your Name", >> "%PROJECT_DIR%\setup.py"
echo     author_email="your.email@example.com", >> "%PROJECT_DIR%\setup.py"
echo     description="A short description of the project", >> "%PROJECT_DIR%\setup.py"
echo     keywords="python, project", >> "%PROJECT_DIR%\setup.py"
echo     url="https://github.com/yourusername/%PROJECT_NAME%", >> "%PROJECT_DIR%\setup.py"
echo     classifiers=[ >> "%PROJECT_DIR%\setup.py"
echo         "Development Status :: 3 - Alpha", >> "%PROJECT_DIR%\setup.py"
echo         "Intended Audience :: Developers", >> "%PROJECT_DIR%\setup.py"
echo         "Programming Language :: Python :: 3", >> "%PROJECT_DIR%\setup.py"
echo         "Programming Language :: Python :: 3.6", >> "%PROJECT_DIR%\setup.py"
echo         "Programming Language :: Python :: 3.7", >> "%PROJECT_DIR%\setup.py"
echo         "Programming Language :: Python :: 3.8", >> "%PROJECT_DIR%\setup.py"
echo         "Programming Language :: Python :: 3.9", >> "%PROJECT_DIR%\setup.py"
echo     ], >> "%PROJECT_DIR%\setup.py"
echo     python_requires="^>=3.6", >> "%PROJECT_DIR%\setup.py"
echo ^) >> "%PROJECT_DIR%\setup.py"

REM Create requirements.txt
echo Creating requirements.txt...
echo # Add your dependencies here > "%PROJECT_DIR%\requirements.txt"
echo pytest==7.3.1 >> "%PROJECT_DIR%\requirements.txt"
echo pytest-cov==4.1.0 >> "%PROJECT_DIR%\requirements.txt"

REM Create dev-requirements.txt
echo Creating dev-requirements.txt...
echo # Development dependencies > "%PROJECT_DIR%\dev-requirements.txt"
echo pytest==7.3.1 >> "%PROJECT_DIR%\dev-requirements.txt"
echo pytest-cov==4.1.0 >> "%PROJECT_DIR%\dev-requirements.txt"
echo flake8==6.0.0 >> "%PROJECT_DIR%\dev-requirements.txt"
echo black==23.3.0 >> "%PROJECT_DIR%\dev-requirements.txt"
echo isort==5.12.0 >> "%PROJECT_DIR%\dev-requirements.txt"
echo mypy==1.3.0 >> "%PROJECT_DIR%\dev-requirements.txt"

REM Create README.md
echo Creating README.md...
echo # %PROJECT_NAME% > "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo A short description of the project. >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## Installation >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ```bash >> "%PROJECT_DIR%\README.md"
echo # Clone the repository >> "%PROJECT_DIR%\README.md"
echo git clone https://github.com/yourusername/%PROJECT_NAME%.git >> "%PROJECT_DIR%\README.md"
echo cd %PROJECT_NAME% >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo # Create and activate virtual environment >> "%PROJECT_DIR%\README.md"
echo python -m venv venv >> "%PROJECT_DIR%\README.md"
echo venv\Scripts\activate # On Windows >> "%PROJECT_DIR%\README.md"
echo # source venv/bin/activate # On Unix/macOS >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo # Install dependencies >> "%PROJECT_DIR%\README.md"
echo pip install -r requirements.txt >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo # Install in development mode >> "%PROJECT_DIR%\README.md"
echo pip install -e . >> "%PROJECT_DIR%\README.md"
echo ``` >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## Usage >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ```python >> "%PROJECT_DIR%\README.md"
echo import %PROJECT_NAME% >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo # Add usage examples here >> "%PROJECT_DIR%\README.md"
echo ``` >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## Development >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ```bash >> "%PROJECT_DIR%\README.md"
echo # Install development dependencies >> "%PROJECT_DIR%\README.md"
echo pip install -r dev-requirements.txt >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo # Run tests >> "%PROJECT_DIR%\README.md"
echo pytest >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo # Run tests with coverage >> "%PROJECT_DIR%\README.md"
echo pytest --cov=%PROJECT_NAME% >> "%PROJECT_DIR%\README.md"
echo ``` >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo ## License >> "%PROJECT_DIR%\README.md"
echo. >> "%PROJECT_DIR%\README.md"
echo [MIT](LICENSE) >> "%PROJECT_DIR%\README.md"

REM Create .gitignore
echo Creating .gitignore...
echo # Byte-compiled / optimized / DLL files > "%PROJECT_DIR%\.gitignore"
echo __pycache__/ >> "%PROJECT_DIR%\.gitignore"
echo *.py[cod] >> "%PROJECT_DIR%\.gitignore"
echo *$py.class >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # C extensions >> "%PROJECT_DIR%\.gitignore"
echo *.so >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Distribution / packaging >> "%PROJECT_DIR%\.gitignore"
echo .Python >> "%PROJECT_DIR%\.gitignore"
echo build/ >> "%PROJECT_DIR%\.gitignore"
echo develop-eggs/ >> "%PROJECT_DIR%\.gitignore"
echo dist/ >> "%PROJECT_DIR%\.gitignore"
echo downloads/ >> "%PROJECT_DIR%\.gitignore"
echo eggs/ >> "%PROJECT_DIR%\.gitignore"
echo .eggs/ >> "%PROJECT_DIR%\.gitignore"
echo lib/ >> "%PROJECT_DIR%\.gitignore"
echo lib64/ >> "%PROJECT_DIR%\.gitignore"
echo parts/ >> "%PROJECT_DIR%\.gitignore"
echo sdist/ >> "%PROJECT_DIR%\.gitignore"
echo var/ >> "%PROJECT_DIR%\.gitignore"
echo wheels/ >> "%PROJECT_DIR%\.gitignore"
echo *.egg-info/ >> "%PROJECT_DIR%\.gitignore"
echo .installed.cfg >> "%PROJECT_DIR%\.gitignore"
echo *.egg >> "%PROJECT_DIR%\.gitignore"
echo MANIFEST >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # PyInstaller >> "%PROJECT_DIR%\.gitignore"
echo # Usually these files are written by a python PyInstaller build script >> "%PROJECT_DIR%\.gitignore"
echo *.manifest >> "%PROJECT_DIR%\.gitignore"
echo *.spec >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Installer logs >> "%PROJECT_DIR%\.gitignore"
echo pip-log.txt >> "%PROJECT_DIR%\.gitignore"
echo pip-delete-this-directory.txt >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Unit test / coverage reports >> "%PROJECT_DIR%\.gitignore"
echo htmlcov/ >> "%PROJECT_DIR%\.gitignore"
echo .tox/ >> "%PROJECT_DIR%\.gitignore"
echo .nox/ >> "%PROJECT_DIR%\.gitignore"
echo .coverage >> "%PROJECT_DIR%\.gitignore"
echo .coverage.* >> "%PROJECT_DIR%\.gitignore"
echo .cache >> "%PROJECT_DIR%\.gitignore"
echo nosetests.xml >> "%PROJECT_DIR%\.gitignore"
echo coverage.xml >> "%PROJECT_DIR%\.gitignore"
echo *.cover >> "%PROJECT_DIR%\.gitignore"
echo *.py,cover >> "%PROJECT_DIR%\.gitignore"
echo .hypothesis/ >> "%PROJECT_DIR%\.gitignore"
echo .pytest_cache/ >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # Environments >> "%PROJECT_DIR%\.gitignore"
echo .env >> "%PROJECT_DIR%\.gitignore"
echo .venv >> "%PROJECT_DIR%\.gitignore"
echo env/ >> "%PROJECT_DIR%\.gitignore"
echo venv/ >> "%PROJECT_DIR%\.gitignore"
echo ENV/ >> "%PROJECT_DIR%\.gitignore"
echo env.bak/ >> "%PROJECT_DIR%\.gitignore"
echo venv.bak/ >> "%PROJECT_DIR%\.gitignore"
echo. >> "%PROJECT_DIR%\.gitignore"
echo # IDE files >> "%PROJECT_DIR%\.gitignore"
echo .idea/ >> "%PROJECT_DIR%\.gitignore"
echo .vscode/ >> "%PROJECT_DIR%\.gitignore"
echo *.swp >> "%PROJECT_DIR%\.gitignore"
echo *.swo >> "%PROJECT_DIR%\.gitignore"

REM Create __init__.py in the project package
echo Creating __init__.py...
echo """  > "%PROJECT_DIR%\%PROJECT_NAME%\__init__.py"
echo %PROJECT_NAME% package. >> "%PROJECT_DIR%\%PROJECT_NAME%\__init__.py"
echo """ >> "%PROJECT_DIR%\%PROJECT_NAME%\__init__.py"
echo. >> "%PROJECT_DIR%\%PROJECT_NAME%\__init__.py"
echo __version__ = "0.1.0" >> "%PROJECT_DIR%\%PROJECT_NAME%\__init__.py"

REM Create a sample module
echo Creating sample module...
echo """  > "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo Sample module. >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo """ >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo. >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo def hello^(name: str^) -^> str: >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo     """ >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo     Return a greeting message. >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo. >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo     Args: >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo         name: The name to greet. >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo. >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo     Returns: >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo         A greeting message. >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo     """ >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo     return f"Hello, {name}!" >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo. >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo. >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo if __name__ == "__main__": >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"
echo     print^(hello^("World"^)^) >> "%PROJECT_DIR%\%PROJECT_NAME%\sample.py"

REM Create a sample test
echo Creating sample test...
echo """  > "%PROJECT_DIR%\tests\test_sample.py"
echo Tests for the sample module. >> "%PROJECT_DIR%\tests\test_sample.py"
echo """ >> "%PROJECT_DIR%\tests\test_sample.py"
echo. >> "%PROJECT_DIR%\tests\test_sample.py"
echo import pytest >> "%PROJECT_DIR%\tests\test_sample.py"
echo. >> "%PROJECT_DIR%\tests\test_sample.py"
echo from %PROJECT_NAME%.sample import hello >> "%PROJECT_DIR%\tests\test_sample.py"
echo. >> "%PROJECT_DIR%\tests\test_sample.py"
echo. >> "%PROJECT_DIR%\tests\test_sample.py"
echo def test_hello^(^): >> "%PROJECT_DIR%\tests\test_sample.py"
echo     """Test the hello function.""" >> "%PROJECT_DIR%\tests\test_sample.py"
echo     assert hello^("World"^) == "Hello, World!" >> "%PROJECT_DIR%\tests\test_sample.py"
echo     assert hello^("Python"^) == "Hello, Python!" >> "%PROJECT_DIR%\tests\test_sample.py"

REM Create test __init__.py
echo Creating tests/__init__.py...
echo """  > "%PROJECT_DIR%\tests\__init__.py"
echo Test package. >> "%PROJECT_DIR%\tests\__init__.py"
echo """ >> "%PROJECT_DIR%\tests\__init__.py"

REM Create pyproject.toml
echo Creating pyproject.toml...
echo [build-system] > "%PROJECT_DIR%\pyproject.toml"
echo requires = ["setuptools>=42", "wheel"] >> "%PROJECT_DIR%\pyproject.toml"
echo build-backend = "setuptools.build_meta" >> "%PROJECT_DIR%\pyproject.toml"
echo. >> "%PROJECT_DIR%\pyproject.toml"
echo [tool.black] >> "%PROJECT_DIR%\pyproject.toml"
echo line-length = 88 >> "%PROJECT_DIR%\pyproject.toml"
echo target-version = ['py36', 'py37', 'py38', 'py39'] >> "%PROJECT_DIR%\pyproject.toml"
echo include = '\.pyi?$' >> "%PROJECT_DIR%\pyproject.toml"
echo. >> "%PROJECT_DIR%\pyproject.toml"
echo [tool.isort] >> "%PROJECT_DIR%\pyproject.toml"
echo profile = "black" >> "%PROJECT_DIR%\pyproject.toml"
echo line_length = 88 >> "%PROJECT_DIR%\pyproject.toml"
echo. >> "%PROJECT_DIR%\pyproject.toml"
echo [tool.mypy] >> "%PROJECT_DIR%\pyproject.toml"
echo python_version = "3.6" >> "%PROJECT_DIR%\pyproject.toml"
echo warn_return_any = true >> "%PROJECT_DIR%\pyproject.toml"
echo warn_unused_configs = true >> "%PROJECT_DIR%\pyproject.toml"
echo disallow_untyped_defs = true >> "%PROJECT_DIR%\pyproject.toml"
echo disallow_incomplete_defs = true >> "%PROJECT_DIR%\pyproject.toml"

REM Create LICENSE file
echo Creating LICENSE file...
echo MIT License > "%PROJECT_DIR%\LICENSE"
echo. >> "%PROJECT_DIR%\LICENSE"
echo Copyright ^(c^) 2023 Your Name >> "%PROJECT_DIR%\LICENSE"
echo. >> "%PROJECT_DIR%\LICENSE"
echo Permission is hereby granted, free of charge, to any person obtaining a copy >> "%PROJECT_DIR%\LICENSE"
echo of this software and associated documentation files ^(the "Software"^), to deal >> "%PROJECT_DIR%\LICENSE"
echo in the Software without restriction, including without limitation the rights >> "%PROJECT_DIR%\LICENSE"
echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell >> "%PROJECT_DIR%\LICENSE"
echo copies of the Software, and to permit persons to whom the Software is >> "%PROJECT_DIR%\LICENSE"
echo furnished to do so, subject to the following conditions: >> "%PROJECT_DIR%\LICENSE"
echo. >> "%PROJECT_DIR%\LICENSE"
echo The above copyright notice and this permission notice shall be included in all >> "%PROJECT_DIR%\LICENSE"
echo copies or substantial portions of the Software. >> "%PROJECT_DIR%\LICENSE"
echo. >> "%PROJECT_DIR%\LICENSE"
echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR >> "%PROJECT_DIR%\LICENSE"
echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, >> "%PROJECT_DIR%\LICENSE"
echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE >> "%PROJECT_DIR%\LICENSE"
echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER >> "%PROJECT_DIR%\LICENSE"
echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, >> "%PROJECT_DIR%\LICENSE"
echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE >> "%PROJECT_DIR%\LICENSE"
echo SOFTWARE. >> "%PROJECT_DIR%\LICENSE"

REM Create a batch file to activate the virtual environment
echo Creating activate.cmd...
echo @echo off > "%PROJECT_DIR%\activate.cmd"
echo call venv\Scripts\activate >> "%PROJECT_DIR%\activate.cmd"

echo.
echo Python project "%PROJECT_NAME%" created successfully!
echo.
echo To get started:
echo 1. cd %PROJECT_NAME%
echo 2. activate.cmd
echo 3. pip install -r requirements.txt
echo 4. pip install -e .
echo 5. pytest
echo.
echo Happy coding!

endlocal
