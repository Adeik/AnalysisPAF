echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""
logpath="/nfs/fanae/user/vrbouza/Documents/TFG/Executions/"
ext="LEPIDCOMPARISONlogs"
logpath=$logpath$ext

workingpath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$1" == "an" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating jobs..."
  LIDtop = $(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath DottHAnalysis.sh -F \"an $2 ttH_LIDtop\")
  echo $LIDtop
  LIDstop = $(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$LIDtop DottHAnalysis.sh -F \"an $2 ttH_LIDstop\")
  echo $LIDstop
  LIDtth = $(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$LIDstop DottHAnalysis.sh -F \"an $2 ttH_LIDtth\")
  echo $LIDtth
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
