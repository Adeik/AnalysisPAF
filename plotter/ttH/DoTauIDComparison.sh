echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
if [ "$1" == "an" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting TAU selection without tighter variables analysis"
  source DottHAnalysis.sh an $2 ttH_TIDtau
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting TTH analysis"
  source DottHAnalysis.sh an $2 ttH_TIDtth
  echo "%%%%%> DONE"
  echo ""
elif [ "$1" == "pl" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH PLOTTER EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting to plot"
  cd ..
  source DottHAnalysis.sh pl tau
  source DottHAnalysis.sh pl tth
  cd ttH
else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi
