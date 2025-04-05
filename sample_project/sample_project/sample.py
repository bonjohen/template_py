Sample module. 
 
def hello(name: str) -> str: 
    Return a greeting message. 
 
    Args: 
        name: The name to greet. 
 
    Returns: 
        A greeting message. 
    return f"Hello, {name}" 
 
 
if __name__ == "__main__": 
    print(hello("World")) 
