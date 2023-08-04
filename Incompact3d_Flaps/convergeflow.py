import subprocess
import time


def run_executable():
    cwd = "/home/jackyzhang/anaconda3/bin/IBM-Flaps-RL-trialsb3/rl-training/Incompact3d_Flaps"
    subprocess.run("./incompact3d", check=True, cwd=cwd, stdout=subprocess.DEVNULL)


if __name__ == "__main__":
    count = 1
    while count<852:    
        count = count+1
        run_executable()
