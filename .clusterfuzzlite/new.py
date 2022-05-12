import subprocess

devnull = open("/dev/null", "w")
def run():
        ps = subprocess.Popen(["/bin/gzip", "-h"], shell=False, stdout=devnull)
        ps.wait()

if __name__ == "__main__":
        for x in range(0,1000):
                run()
