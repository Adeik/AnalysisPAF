echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
logpath="/nfs/fanae/user/vrbouza/Documents/TFG/Executions/"
  ext="TAUIDCOMPARISONlogs"
logpath=$logpath$ext

workingpath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$1" == "an" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating jobs..."
  TIDtau=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -F "an $2 ttH_TIDtau" DottHAnalysis.sh)
  echo $TIDtau
  
  TIDtth=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$TIDtau -F "an $2 ttH_TIDtth" DottHAnalysis.sh)
  echo $TIDtth
  
  checkTIDtau=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$TIDtth -F "$2 ttH_TIDtau /nfs/fanae/user/vrbouza/Documents/TFG/tauidcomparison/AnalysisPAF/ttH_temp/tauidcomparison/tau" check.sh)
  echo $checkTIDtau
  
  checkTIDtth=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$checkTIDtau -F "$2 ttH_TIDtth /nfs/fanae/user/vrbouza/Documents/TFG/tauidcomparison/AnalysisPAF/ttH_temp/tauidcomparison/tth" check.sh)
  echo $checkTIDtth
  
elif [ "$1" == "pl" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH PLOTTER EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Remaking libraries..."
  source RemakeLibraries.sh
  
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating jobs..."
  source QueueDottHAnalysis.sh pl tau
  source QueueDottHAnalysis.sh pl tth

else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi
