echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Setting up the environment"
source pre_start.sh

echo "%%%%%> DONE"
echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting TOP analysis"
source DottHAnalysis.sh an $1 ttH_LIDtop
source DottHAnalysis.sh an $1 ttH_LIDstop
source DottHAnalysis.sh an $1 ttH_LIDtth
