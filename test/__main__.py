from . import heavy_math
import multiprocessing
import time

num_cpus = multiprocessing.cpu_count()
print(f"Starting stress test on {num_cpus} CPU cores...")

start_time = time.time()

# Run heavy_math on all cores at once
with multiprocessing.Pool(num_cpus) as pool:
    pool.map(heavy_math, [10000000] * num_cpus)
    
end_time = time.time()
print(f"Test completed in {end_time - start_time:.2f} seconds.")
