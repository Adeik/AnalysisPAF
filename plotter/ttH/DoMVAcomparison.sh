echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
if [ "$1" == "an" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting analysis with extra tight wp"
  source DottHAnalysis.sh an $2 ttH_LMVAet
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting analysis with very tight wp"
  source DottHAnalysis.sh an $2 ttH_LMVAvt
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting analysis with tight wp"
  source DottHAnalysis.sh an $2 ttH_LMVAt
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting analysis with medium wp"
  source DottHAnalysis.sh an $2 ttH_LMVAm
  echo "%%%%%> DONE"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting analysis with ttH wp"
  source DottHAnalysis.sh an $2 ttH_LMVAtth
  echo "%%%%%> DONE"
  echo ""
elif [ "$1" == "pl" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH PLOTTER EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting to plot"
  
  source DottHAnalysis.sh pl et
  source DottHAnalysis.sh pl vt
  source DottHAnalysis.sh pl t
  source DottHAnalysis.sh pl m
  source DottHAnalysis.sh pl tth

else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi
