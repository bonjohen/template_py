Tests for the sample module. 
 
import pytest 
 
from sample_project.sample import hello 
 
 
def test_hello(): 
    """Test the hello function.""" 
    assert hello("World") == "Hello, World" 
    assert hello("Python") == "Hello, Python" 
