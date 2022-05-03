import os
import sys
import filecmp
import re

REGEX_STRING = r"^([XY]E: )?(?P<value>\d+.\d+)"

def is_edc(file_out, golden_file):
    total_diff_pct = 0
    with open(golden_file, "r") as gld:
        with open(file_out, "r") as run:
            gline = gld.readline()
            rline = run.readline()
            while (gline != "" and rline != ""):
                gmatch = re.search(REGEX_STRING, gline)
                rmatch = re.search(REGEX_STRING, rline)
                gline = gld.readline()
                rline = run.readline()
                if (gline == rline):
                    continue
                if (gmatch and not rmatch):
                    return True
                
                gld_val = float(gmatch.group("value"))
                run_val = float(rmatch.group("value"))

                if (gld_val == 0):
                    total_diff_pct += abs(run_val - gld_val)
                else:
                    total_diff_pct += (abs(run_val - gld_val) / gld_val) * 100
    return total_diff_pct > 0.01

print("\nBegin\n")

# set directory variables
curdir = os.path.dirname(os.path.realpath(__file__))
std_output = curdir + "/llfi/std_output"
prog_output = curdir + "/llfi/prog_output"
baseline = curdir + "/llfi/baseline"
errdir = curdir + "/llfi/error_output"

# read golden output from ./baseline/golden_std_output
print ("Reading golden output...")
file_gld_out = baseline + "/golden_std_output"
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
    file_out = std_output + "/std_outputfile-run-0-" + str(f)
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






