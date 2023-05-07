# USAGE: bash run_pipeline.sh
# to produce plots for isles and abyss
# and the summary table for the Zipf's law tests

python3 countwords.py books/isles.txt isles.dat
python3 countwords.py books/abyss.txt abyss.dat

python3 plotcounts.py isles.dat isles.png
python3 plotcounts.py abyss.dat abyss.png

# Generate summary table
python3 testzipf.py abyss.dat isles.dat > results.txt
