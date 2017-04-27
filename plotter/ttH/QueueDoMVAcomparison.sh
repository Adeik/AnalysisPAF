echo ""
echo "%%%%%%%%%%%%%%%%%%%%%%% ttH ANALYSIS: COMPARISON BETWEEN TOP, STOP AND TTH LEPTON IDS %%%%%%%%%%%%%%%%%%%%%%%%%%"
echo ""

logpath="/nfs/fanae/user/vrbouza/Documents/TFG/Executions/"
ext="LEPMVACOMPARISONlogs"
logpath=$logpath$ext

workingpath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$1" == "an" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating jobs..."
  MVAet=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -F "an $2 ttH_LMVAet" DottHAnalysis.sh)
  echo $MVAet

  MVAvt=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$MVAet DottHAnalysis.sh -F "an $2 ttH_LMVAvt")
  echo $MVAvt

  MVAt=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$MVAvt DottHAnalysis.sh -F "an $2 ttH_LMVAt")
  echo $MVAt

  MVAm=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$MVAt  DottHAnalysis.sh -F "an $2 ttH_LMVAm")
  echo $MVAm

  MVAtth=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$MVAm DottHAnalysis.sh -F "an $2 ttH_LMVAtth")
  echo $MVAtth
  
  checkMVAet=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$MVAtth -F "$2 ttH_LMVAet /nfs/fanae/user/vrbouza/Documents/TFG/lepMVAcomparison/AnalysisPAF/ttH_temp/lepMVAcomparison/extratight" check.sh)
  echo $checkMVAet
  
  checkMVAvt=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$checkMVAet -F "$2 ttH_LMVAvt /nfs/fanae/user/vrbouza/Documents/TFG/lepMVAcomparison/AnalysisPAF/ttH_temp/lepMVAcomparison/verytight" check.sh)
  echo $checkMVAvt
  
  checkMVAt=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$checkMVAvt -F "$2 ttH_LMVAt /nfs/fanae/user/vrbouza/Documents/TFG/lepMVAcomparison/AnalysisPAF/ttH_temp/lepMVAcomparison/tight" check.sh)
  echo $checkMVAt
  
  checkMVAm=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$checkMVAt -F "$2 ttH_LMVAm /nfs/fanae/user/vrbouza/Documents/TFG/lepMVAcomparison/AnalysisPAF/ttH_temp/lepMVAcomparison/medium" check.sh)
  echo $checkMVAm

  checkMVAtth=$(qsub -q proof -l nodes=1:ppn=$2 -o $logpath -e $logpath -d $workingpath -W depend=afterany:$checkMVAm -F "$2 ttH_LMVAtth /nfs/fanae/user/vrbouza/Documents/TFG/lepMVAcomparison/AnalysisPAF/ttH_temp/lepMVAcomparison/tth" check.sh)
  echo $checkMVAtth

  echo "%%%%%> DONE"
  echo ""
elif [ "$1" == "pl" ]; then
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ttH PLOTTER EXECUTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Creating jobs..."
  source QueueDottHAnalysis.sh pl et
  source QueueDottHAnalysis.sh pl vt
  source QueueDottHAnalysis.sh pl t
  source QueueDottHAnalysis.sh pl m
  source QueueDottHAnalysis.sh pl tth
  echo "%%%%%> DONE"
  echo ""

else
    echo "ERROR - No valid arguments given"
    echo "Please, execute this script with a valid argument"
fi