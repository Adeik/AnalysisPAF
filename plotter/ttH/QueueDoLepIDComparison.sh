echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Setting up the environment"
source pre_start.sh
echo "%%%%%> DONE"
echo ""
if [ "$1" == "an" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating jobs..."
  LIDtop = $(qsub -q proof -l nodes=1:ppn=$2 -o /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPIDCOMPARISONlogs -e /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPIDCOMPARISONlogs DottHAnalysis.sh -F \"an $2 ttH_LIDtop\")
  echo $LIDtop
  LIDstop = $(qsub -q proof -l nodes=1:ppn=$2 -o /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPIDCOMPARISONlogs -e /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPIDCOMPARISONlogs -W depend=afterany:$LIDtop DottHAnalysis.sh -F \"an $2 ttH_LIDstop\")
  echo $LIDstop
  LIDtth = $(qsub -q proof -l nodes=1:ppn=$2 -o /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPIDCOMPARISONlogs -e /nfs/fanae/user/vrbouza/Documents/TFG/Executions/LEPIDCOMPARISONlogs -W depend=afterany:$LIDstop DottHAnalysis.sh -F \"an $2 ttH_LIDtth\")
  echo $LIDtth
elif [ "$1" == "pl" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH PLOTTER EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Starting to plot"
  source QueueDottHAnalysis.sh pl top
  source QueueDottHAnalysis.sh pl Stop
  source QueueDottHAnalysis.sh pl ttH

else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi
