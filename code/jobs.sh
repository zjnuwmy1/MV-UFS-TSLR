#!/bin/bash
#SBATCH --nodes=1                   # 节点数量
#SBATCH --ntasks-per-node=56        # 每个节点核心数量
#SBATCH --ntasks=56                 # 总核心数
#SBATCH --partition=g1_share        # 队列分区且必须指定正确分区
#SBATCH --job-name=3sources            # 作业名称
#SBATCH --output=outputs/%x.out       # 正常日志输出 (%j 参数值为 jobId)
#SBATCH --error=outputs/%x.err        # 错误日志输出 (%j 参数值为 jobId)

##############################################
#          Software Envrironment             #
##############################################
unset I_MPI_PMI_LIBRARY                      # 取消默认mpi库，使用intel自带
export I_MPI_JOB_RESPECT_PROCESS_PLACEMENT=0 # intel 多节点作业所需修改参数
module load intel/2022 intelmpi/2022         # intel 环境加载

##############################################
#               Run job                      #
##############################################

name=$SLURM_JOB_NAME
matlab -nodesktop -nosplash -nodisplay -r "name='$name'; main_unsupervised; quit;"
