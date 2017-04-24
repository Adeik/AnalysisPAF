echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
logpath="/nfs/fanae/user/vrbouza/Documents/TFG/Executions/"
ext="LEPIDCOMPARISONlogs"
logpath=$logpath$ext

workingpath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$1" == "an" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating jobs..."
  LIDtop=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -F "an $2 ttH_LIDtop" DottHAnalysis.sh)
  echo $LIDtop
  
  LIDstop=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$LIDtop -F "an $2 ttH_LIDstop" DottHAnalysis.sh)
  echo $LIDstop
  
  LIDtth=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$LIDstop -F "an $2 ttH_LIDtth" DottHAnalysis.sh)
  echo $LIDtth
  
  checkLIDtop=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$LIDtth -F "$2 ttH_LIDtop /nfs/fanae/user/vrbouza/Documents/TFG/lepidcomparison/AnalysisPAF/ttH_temp/lepidcomparison/top" check.sh)
  echo $checkLIDtop
  
  checkLIDstop=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$checkLIDtop -F "$2 ttH_LIDstop /nfs/fanae/user/vrbouza/Documents/TFG/lepidcomparison/AnalysisPAF/ttH_temp/lepidcomparison/Stop" check.sh)
  echo $checkLIDstop
  
  checkLIDtth=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$checkLIDstop -F "$2 ttH_LIDtth /nfs/fanae/user/vrbouza/Documents/TFG/lepidcomparison/AnalysisPAF/ttH_temp/lepidcomparison/ttH" check.sh)
  echo $checkLIDtth
  
elif [ "$1" == "pl" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH PLOTTER EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating jobs..."
  source QueueDottHAnalysis.sh pl top
  source QueueDottHAnalysis.sh pl Stop
  source QueueDottHAnalysis.sh pl ttH

else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi
