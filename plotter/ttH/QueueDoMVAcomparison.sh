echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Setting up the environment"
source pre_start.sh
echo "%%%%%> DONE"
echo ""
if [ "$1" == "an" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting analysis with extra tight wp"
  MVAet = $(qsub -q proof -l nodes=1:ppn=$2 DottHAnalysis.sh -F \"an $2 ttH_LMVAet\")
  echo $MVAet
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting analysis with very tight wp"
  MVAvt = $(qsub -q proof -l nodes=1:ppn=$2 -W depend=afterany:$MVAet DottHAnalysis.sh -F \"an $2 ttH_LMVAvt\")
  echo $MVAvt
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting analysis with tight wp"
  MVAt = $(qsub -q proof -l nodes=1:ppn=$2 -W depend=afterany:$MVAvt DottHAnalysis.sh -F \"an $2 ttH_LMVAt\")
  echo $MVAt
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting analysis with medium wp"
  MVAm = $(qsub -q proof -l nodes=1:ppn=$2 -W depend=afterany:$MVAt DottHAnalysis.sh -F \"an $2 ttH_LMVAm\")
  echo $MVAm
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting analysis with ttH wp"
  MVAtth = $(qsub -q proof -l nodes=1:ppn=$2 -W depend=afterany:$MVAm DottHAnalysis.sh -F \"an $2 ttH_LMVAtth\")
  echo $MVAtth
  echo "%%%%%> DONE"
  echo ""
elif [ "$1" == "pl" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH PLOTTER EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting to plot"
  cd ..
  root -l -b -q "ttH/DrawPlots.C(\"Muon\",\"et\")"
  root -l -b -q "ttH/DrawPlots.C(\"Elec\",\"et\")"
  root -l -b -q "ttH/DrawPlots.C(\"ElMu\",\"et\")"
  root -l -b -q "ttH/DrawPlots.C(\"2lSS\",\"et\")"
  root -l -b -q "ttH/DrawPlots.C(\"3l\",\"et\")"
  root -l -b -q "ttH/DrawPlots.C(\"4l\",\"et\")"
  root -l -b -q "ttH/DrawPlots.C(\"All\",\"et\")"
  
  root -l -b -q "ttH/DrawPlots.C(\"Muon\",\"vt\")"
  root -l -b -q "ttH/DrawPlots.C(\"Elec\",\"vt\")"
  root -l -b -q "ttH/DrawPlots.C(\"ElMu\",\"vt\")"
  root -l -b -q "ttH/DrawPlots.C(\"2lSS\",\"vt\")"
  root -l -b -q "ttH/DrawPlots.C(\"3l\",\"vt\")"
  root -l -b -q "ttH/DrawPlots.C(\"4l\",\"vt\")"
  root -l -b -q "ttH/DrawPlots.C(\"All\",\"vt\")"
  
  root -l -b -q "ttH/DrawPlots.C(\"Muon\",\"t\")"
  root -l -b -q "ttH/DrawPlots.C(\"Elec\",\"t\")"
  root -l -b -q "ttH/DrawPlots.C(\"ElMu\",\"t\")"
  root -l -b -q "ttH/DrawPlots.C(\"2lSS\",\"t\")"
  root -l -b -q "ttH/DrawPlots.C(\"3l\",\"t\")"
  root -l -b -q "ttH/DrawPlots.C(\"4l\",\"t\")"
  root -l -b -q "ttH/DrawPlots.C(\"All\",\"t\")"
  
  root -l -b -q "ttH/DrawPlots.C(\"Muon\",\"m\")"
  root -l -b -q "ttH/DrawPlots.C(\"Elec\",\"m\")"
  root -l -b -q "ttH/DrawPlots.C(\"ElMu\",\"m\")"
  root -l -b -q "ttH/DrawPlots.C(\"2lSS\",\"m\")"
  root -l -b -q "ttH/DrawPlots.C(\"3l\",\"m\")"
  root -l -b -q "ttH/DrawPlots.C(\"4l\",\"m\")"
  root -l -b -q "ttH/DrawPlots.C(\"All\",\"m\")"
  
  root -l -b -q "ttH/DrawPlots.C(\"Muon\",\"tth\")"
  root -l -b -q "ttH/DrawPlots.C(\"Elec\",\"tth\")"
  root -l -b -q "ttH/DrawPlots.C(\"ElMu\",\"tth\")"
  root -l -b -q "ttH/DrawPlots.C(\"2lSS\",\"tth\")"
  root -l -b -q "ttH/DrawPlots.C(\"3l\",\"tth\")"
  root -l -b -q "ttH/DrawPlots.C(\"4l\",\"tth\")"
  root -l -b -q "ttH/DrawPlots.C(\"All\",\"tth\")"
  cd ttH
else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi
