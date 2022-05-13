import sys, re

DI_COUNT_REGEX = r"^(?P<instruction>\d+):\s+(?P<count>\d+)"
EDC_RANK_REGEX = r"^(?P<instruction>\d+):\s+(?P<outerLoop>\d+)\s+(?P<innerLoop>\d+)\s+(?P<domLoop>\d+)\s+(?P<dataNumerator>\d+)/?(?P<dataDenominator>\d*)"

# values based on work by Thomat et al.
ALPHA = 4
BETA = 3
GAMMA = 1
MU = 2

ranks = []

# compute EDC rank based on a match object
def get_edc_rank(match):
    outerLoop = int(match.group("outerLoop"))
    innerLoop = int(match.group("innerLoop"))
    domLoop = int(match.group("domLoop"))
    numerator = int(match.group("dataNumerator"))
    denom_match = match.group("dataDenominator")
    denominator = int(denom_match) if denom_match != "" else 1
    return (max((ALPHA * innerLoop) + (BETA * domLoop) + (GAMMA * (numerator / denominator)), 1) / max(MU * outerLoop, 1))

def compute_edc_ranked_count(di_file_name, edc_file_name):
    with open(di_file_name, "r") as di_file:
        with open(edc_file_name, "r") as edc_file:
            inst_count = 1
            for edc_line in edc_file:
                edc_match = re.search(EDC_RANK_REGEX, edc_line)
                edc_inst = int(edc_match.group("instruction"))
                while (inst_count < edc_inst):
                    di_line = di_file.readline()
                    di_match = re.search(DI_COUNT_REGEX, di_line)
                    di_inst = int(di_match.group("instruction"))
                    count = float(di_match.group("count"))
                    if (di_inst == edc_inst):
                        edc_rank = get_edc_rank(edc_match)
                        ranks.append((edc_inst, count * edc_rank, count))
                        inst_count = edc_inst
                    else:
                        ranks.append((di_inst, count, count))
                        inst_count = di_inst
            di_line = di_file.readline()
            while (di_line != ""):
                di_match = re.search(DI_COUNT_REGEX, di_line)
                di_inst = int(di_match.group("instruction"))
                count = float(di_match.group("count"))
                ranks.append((di_inst, count, count))
                di_line = di_file.readline()

def dump_data(out_file_name):
    with open(out_file_name, "w") as out_file:
        weighted_ranks = sum([r[1] for r in ranks])
        total_di_count = sum([r[2] for r in ranks])
        out_file.write("TOTAL WEIGHTED: " + str(round(weighted_ranks, 2)) + "\n")
        out_file.write("TOTAL DI COUNT: " + str(total_di_count) + "\n")
        out_file.write("WEIGHTED EDC RANKED DI COUNT: " + str(weighted_ranks / total_di_count) + "\n")
        for ranked in ranks:
            out_file.write(str(ranked[0]) + ": " + str(ranked[1]) + "\n")

def main():
    argc = len(sys.argv)
    if (argc != 4):
        print("Expected 3 arguments, but only " + (argc - 1) + " were provided!")
        return
    di_count_file_name = sys.argv[1]
    edc_rank_file_name = sys.argv[2]
    out_file_name = sys.argv[3]
    compute_edc_ranked_count(di_count_file_name, edc_rank_file_name)
    dump_data(out_file_name)

if __name__ == "__main__":
    main()