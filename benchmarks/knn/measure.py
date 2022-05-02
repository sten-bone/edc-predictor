import os
import sys
import filecmp
import re

REGEX_STRING = r"^(\d+)\s*(\d+)\s*(\d+)\s*(\d+)\s*(\d+)\s*(?P<name>\S+)"

def is_edc(file_out, golden_file):
    with open(golden_file, "r") as gld:
        with open(file_out, "r") as run:
            if (gld.readline() != run.readline()):
                return True
            
            gline = gld.readline()
            rline = run.readline()
            ctr = 1
            while (gline != "" and rline != ""):
                gmatch = re.match(REGEX_STRING, gline)
                rmatch = re.match(REGEX_STRING, rline)
                if (not rmatch):
                    return True
                
                # mismatch in nearest neighbor is EDC (up to 4)
                if (gmatch.group("name") != rmatch.group("name") and ctr < 5):
                    return True

                gline = gld.readline()
                rline = run.readline()
                ctr += 1
    # trailing line is EDC
    if (gline != "" or rline != ""):
        return True
    return False

print("\nBegin\n")

# set directory variables
curdir = os.path.dirname(os.path.realpath(__file__))
std_output = curdir + "/llfi/std_output"
prog_output = curdir + "/llfi/prog_output"
baseline = curdir + "/llfi/baseline"
errdir = curdir + "/llfi/error_output"

# read golden output from ./baseline/golden_std_output
print ("Reading golden output...")
file_gld_out = baseline + "/output.prof.txt"
print ("Complete.\n")

# read filenames from ./std_output
print ("Reading filenames...")
path, dirs, files = os.walk(std_output).__next__()
run_count = len(files)
print ("Complete. " + str(run_count) + " fault injection runs were performed\n")

# check for SDCs
sdc_count = 0
edc_count = 0
benign_count = 0
crash_count = 0
hang_count = 0
print ("Checking files...")
for f in range(0, run_count):
    print ("Checking fault injection run " + str(f) + "...", end="\r")
    file_out = prog_output + "/output.0-" + str(f) + ".txt"
    try:
        file_err = open(errdir + "/errorfile-run-0-" + str(f))
        error_msg = file_err.read()
        file_err.close()
    except FileNotFoundError:   # no error output
        error_msg = ""
    if ("hang" in error_msg):
        hang_count += 1
    elif ("crash" in error_msg):
        crash_count += 1
    elif filecmp.cmp(file_out, file_gld_out):
        benign_count += 1
    else:
        sdc_count += 1
        if is_edc(file_out, file_gld_out):
            edc_count += 1
sys.stdout.write("\033[K")
print ("Complete.", end="\r")

# print results
print ("\n")
print ("EDC count     = " + str(edc_count))
print ("Non-EDC count = " + str(sdc_count - edc_count))
print ("Crash count   = " + str(crash_count))
print ("Benign count  = " + str(benign_count))
print ("Hang count    = " + str(hang_count))
print ("Total Fi runs = " + str(run_count)) 

# print results to file
par_dir = os.path.split( os.path.abspath(os.path.join(os.path.dirname( __file__ ), os.pardir)))[1]
out = open(curdir + "/results.txt", 'w')
sys.stdout = out
print ("EDC count     = " + str(edc_count))
print ("Non-EDC count = " + str(sdc_count - edc_count))
print ("Crash count   = " + str(crash_count))
print ("Benign count  = " + str(benign_count))
print ("Hang count    = " + str(hang_count))
print ("Total Fi runs = " + str(run_count)) 
out.close()






