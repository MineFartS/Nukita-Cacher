
def heavy_math(n):
    # A simple loop to keep the CPU busy
    count = 0
    for i in range(n):
        count += i**2
    return count