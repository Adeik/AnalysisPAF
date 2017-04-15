echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Setting up the environment"
source pre_start.sh
echo "%%%%%> DONE"
echo ""
if [ "$1" == "an" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting TOP analysis"
  source DottHAnalysis.sh an $2 ttH_LIDtop
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting STOP analysis"
  source DottHAnalysis.sh an $2 ttH_LIDstop
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting TTH analysis"
  source DottHAnalysis.sh an $2 ttH_LIDtth
elif [ "$1" == "pl" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH PLOTTER EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting to plot"
  cd ..
  source DottHAnalysis.sh pl top
  source DottHAnalysis.sh pl Stop
  source DottHAnalysis.sh pl ttH
  cd ttH
else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi
