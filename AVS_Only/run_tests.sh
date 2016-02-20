#!/bin/bash
rm -f results.txt
rm -f *.out
rm -f *.transaction
. ./L_AVS_1.sh
. ./L_AVS_2.sh
. ./L_AVS_3.sh
. ./L_AVS_4.sh
. ./L_AVS_5.sh
. ./L_AVS_6.sh
. ./L_AVS_7.sh
. ./L_AVS_8.sh
cp results.txt ../results.avs_only.txt

