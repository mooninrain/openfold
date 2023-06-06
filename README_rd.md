## Installation (Linux)

There might be problems to run installation scripts directly. Run the following commands instead.

```bash
conda create -n openfold_venv python=3.9
conda install -c conda-forge setuptools=59.5.0 pip openmm=7.5.1 pdbfixer cudatoolkit==11.7.*
conda install -c bioconda hmmer==3.3.2 hhsuite==3.3.0 kalign2==2.04
conda install pytorch==1.13.0 pytorch-cuda=11.7 -c pytorch -c nvidia

pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ biopython==1.79 deepspeed==0.5.10 \
dm-tree==0.1.6 ml-collections==0.1.0 numpy==1.21.2 \
PyYAML==5.4.1 requests==2.26.0 scipy==1.7.1 \
tqdm==4.62.2 typing-extensions==3.10.0.2 pytorch_lightning==1.5.10 \
wandb==0.12.21 modelcif==0.7

pip install git+https://github.com/NVIDIA/dllogger#egg=dllogger

git clone https://github.com/HazyResearch/flash-attention
cd flash-attention
git checkout 5b838a8bef
python3 setup.py install
```

To activate the environment, run: