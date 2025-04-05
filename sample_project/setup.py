from setuptools import setup, find_packages 
 
setup( 
    name="sample_project", 
    version="0.1.0", 
    packages=find_packages(), 
    install_requires=[ 
        # Add your dependencies here 
    ], 
    author="Your Name", 
    author_email="your.email@example.com", 
    description="A short description of the project", 
    keywords="python, project", 
    url="https://github.com/yourusername/sample_project", 
    classifiers=[ 
        "Development Status :: 3 - Alpha", 
        "Intended Audience :: Developers", 
        "Programming Language :: Python :: 3", 
        "Programming Language :: Python :: 3.6", 
        "Programming Language :: Python :: 3.7", 
        "Programming Language :: Python :: 3.8", 
        "Programming Language :: Python :: 3.9", 
    ], 
    python_requires="^>=3.6", 
) 
