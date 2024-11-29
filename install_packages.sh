#!/bin/bash
#SBATCH --account=def-panos
#SBATCH --gres=gpu:p100:1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=6:30:00
#SBATCH --mail-user=aisha.eldeeb.ubc@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --output=aug_env_output.log

module load StdEnv/2020 cuda/11.4 cudnn/8.2.0 llvm/8 python/3.8 geos/3.8.1
export LD_LIBRARY_PATH={$LD_LIBRARY_PATH}:$CUDA_HOME/lib64:/cvmfs/soft.computecanada.ca/easybuild/software/2020/CUDA/cuda11.4/cudnn/8.2.0/lib64
export LLVM_CONFIG=/cvmfs/soft.computecanada.ca/easybuild/software/2020/Core/llvm/8.0.1/bin/llvm-config

export NCCL_BLOCKING_WAIT=1
export ENV_NAME=augmentation_env
export DIR_NAME=augmentation
export TMPDIR=$SLURM_TMPDIR

cd /home/$USER/scratch/$DIR_NAME

# Check if the virtual environment exists, if not, create it
if [ ! -d "$ENV_NAME" ]; then
    python -m venv $ENV_NAME
    source $ENV_NAME/bin/activate
    pip install --no-index -r ./requirements.txt  # Update with the path to requirements.txt
else
    rm -r $ENV_NAME
    python -m venv $ENV_NAME
    source $ENV_NAME/bin/activate
    pip install --no-index -r ./requirements.txt  # Update with the path to requirements.txt

fi

# Clear pip cache to avoid issues with packages
rm -Rf /home/$USER/.cache/pip
