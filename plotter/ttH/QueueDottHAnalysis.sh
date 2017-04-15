#===============================================================================
#
#                         Analysis of the ttH process
#
#===============================================================================
if [ "$1" == "an" ]; then
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating job..."
  qsub -q proof -l nodes=1:ppn=$2 -o /nfs/fanae/user/vrbouza/Documents/TFG/Executions/RANDOMlogs -e /nfs/fanae/user/vrbouza/Documents/TFG/Executions/RANDOMlogs -F "an $2 $3" DottHAnalysis.sh
elif [ "$1" == "pl" ]; then
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH PLOTTER EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo ""
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating job..."
  qsub -o /nfs/fanae/user/vrbouza/Documents/TFG/Executions/RANDOMlogs -e /nfs/fanae/user/vrbouza/Documents/TFG/Executions/RANDOMlogs -F "0" PlotThings.sh
else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi
