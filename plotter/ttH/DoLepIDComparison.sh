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
  root -l -b -q "ttH/DrawPlots.C(\"Muon\",\"top\")"
  root -l -b -q "ttH/DrawPlots.C(\"Elec\",\"top\")"
  root -l -b -q "ttH/DrawPlots.C(\"ElMu\",\"top\")"
  root -l -b -q "ttH/DrawPlots.C(\"2lSS\",\"top\")"
  root -l -b -q "ttH/DrawPlots.C(\"3l\",\"top\")"
  root -l -b -q "ttH/DrawPlots.C(\"4l\",\"top\")"
  root -l -b -q "ttH/DrawPlots.C(\"All\",\"top\")"
  
  root -l -b -q "ttH/DrawPlots.C(\"Muon\",\"Stop\")"
  root -l -b -q "ttH/DrawPlots.C(\"Elec\",\"Stop\")"
  root -l -b -q "ttH/DrawPlots.C(\"ElMu\",\"Stop\")"
  root -l -b -q "ttH/DrawPlots.C(\"2lSS\",\"Stop\")"
  root -l -b -q "ttH/DrawPlots.C(\"3l\",\"Stop\")"
  root -l -b -q "ttH/DrawPlots.C(\"4l\",\"Stop\")"
  root -l -b -q "ttH/DrawPlots.C(\"All\",\"Stop\")"
  
  root -l -b -q "ttH/DrawPlots.C(\"Muon\",\"ttH\")"
  root -l -b -q "ttH/DrawPlots.C(\"Elec\",\"ttH\")"
  root -l -b -q "ttH/DrawPlots.C(\"ElMu\",\"ttH\")"
  root -l -b -q "ttH/DrawPlots.C(\"2lSS\",\"ttH\")"
  root -l -b -q "ttH/DrawPlots.C(\"3l\",\"ttH\")"
  root -l -b -q "ttH/DrawPlots.C(\"4l\",\"ttH\")"
  root -l -b -q "ttH/DrawPlots.C(\"All\",\"ttH\")"
  cd ttH
else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi
