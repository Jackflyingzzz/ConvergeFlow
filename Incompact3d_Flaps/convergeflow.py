import subprocess
import time
import os
import csv
import numpy as np

def run_executable():
    cwd = os.getcwd()
    subprocess.run("./incompact3d", check=True, cwd=cwd, stdout=subprocess.DEVNULL)


def read_force_output(cwd):
    file_path = os.path.join(cwd, 'aerof6.dat')

    drag_vals = []
    lift_vals = []

    with open(file_path, 'r') as force_f:
        for line in force_f:
            values = line.split()
            try:
                drag_vals.append(float(values[0]))
                lift_vals.append(float(values[1]))
            except (IndexError, ValueError):  # catches lines with not enough values or non-numeric values
                # Handle or log the error here
                pass

    return (np.array(drag_vals), np.array(lift_vals))


def write_to_csv(cwd, steps, name="converge_output.csv"):
    (drag, lift) = read_force_output(cwd)
    
    file_path = os.path.join(cwd, name)
    
    # Check if file exists
    file_exists = os.path.exists(file_path)
    
    mode = 'a' if file_exists else 'w'  # Open in append mode if file exists, otherwise write mode
    
    with open(file_path, mode) as csv_file:
        spam_writer = csv.writer(csv_file, delimiter=";", lineterminator="\n")
        
        # If file didn't exist, write the header
        if not file_exists:
            spam_writer.writerow(["Steps", "Drag", "Lift"])
        
        # Write drag and lift values
        for d, l in zip(drag, lift):
            steps = steps+1
            spam_writer.writerow([steps, d, l])


if __name__ == "__main__":
    count = 0
    while count<2:    
        #count = count+1
        run_executable()
        print('executed')
        cwd = os.getcwd()
        start_time = time.time()  # Start the timer
        steps = count*850
        write_to_csv(cwd, steps)
        end_time = time.time()  # End the timer
        print(f"write_to_csv took {end_time - start_time:.2f} seconds to execute.")
        count = count+1



