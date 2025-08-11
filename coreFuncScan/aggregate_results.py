import pandas as pd
import re
from pathlib import Path

results = []

for out_index in range(7):  # 0..6
    log_path = Path(f"out{out_index}_combined/comb_expSignificance.log")
    if log_path.exists():
        with open(log_path, "r") as f:
            content = f.read()
            match = re.search(r"Significance:\s*([-+]?\d*\.\d+|\d+)", content)
            if match:
                value = float(match.group(1))
                results.append({"out_index": out_index, "Significance": value})
            else:
                results.append({"out_index": out_index, "Significance": None})
    else:
        results.append({"out_index": out_index, "Significance": None})

df = pd.DataFrame(results)
df.to_csv("exp_sigs.csv")
print(df)
