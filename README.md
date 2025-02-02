# DeepViT

This repo is the official implementation of ["DeepViT: Towards Deeper Vision Transformer"](https://arxiv.org/abs/2103.11886). The repo is based on the timm library (https://github.com/rwightman/pytorch-image-models) by [Ross Wightman](https://github.com/rwightman)

## Introduction

**Deep Vision Transformer** is initially described in [arxiv](https://arxiv.org/abs/2103.11886), which observes the attention collapese phenomenon when training deep vision transformers: In this paper, we show that, unlike convolution neural networks (CNNs)that can be improved by stacking more convolutional layers, the performance of ViTs saturate fast when scaled to be deeper. More specifically, we empirically observe that such scaling difficulty is caused by the attention collapse issue: as the transformer goes deeper, the attention maps gradually become similar and even much the same after certain layers. In other words, the feature maps tend to be identical in the top layers of deep ViT models. This fact demonstrates that in deeper layers of ViTs, the self-attention mechanism fails to learn effective concepts for representation learning and hinders the model from getting expected performance gain. Based on above observation, we propose a simple yet effective method, named Re-attention, to re-generate the attention maps to increase their diversity at different layers with negligible computation and memory cost. The pro-posed method makes it feasible to train deeper ViT models with consistent performance improvements via minor modification to existing ViT models. Notably, when training a deep ViT model with 32 transformer blocks, the Top-1 classification accuracy can be improved by 1.6% on ImageNet.

<p align="center">
<img src="https://github.com/zhoudaquan/DeepViT_ICCV21/blob/master/figures/performance_comparison.png" | width=500>
</p>

## DeepViT Models

1. Comparison with ViTs

| Model        | Re-attention | Top1 Acc (%) | #params | #Similar Blocks |  Checkpoint | Attention Map |
| :---         |   :---:         |  :---:   |  :---:  | :---: |  :---:   | :---:   | 
| ViT-16       |  NA  |   78.88   |  24.5M  | 5 | [download here](comming soon)| |
| DeepViT-16   |  FC  |   79.10   |  24.5M  | 0  | [download here](comming soon)|  |
| ViT-24       |  NA  |   79.35   |  36.3M  | 11  | [download here](comming soon)|  |
| DeepViT-24   |  FC  |   79.99   |  36.3M  | 0  | [download here](https://drive.google.com/file/d/1lPmKdNMPJq-mq-4FivqIY4JNAPoQHYxV/view?usp=sharing)|  |
| ViT-32       | NA   |   79.27   |  48.1M  | 15 | [download here](comming soon)  |  |
| DeepViT-32 | FC   |   80.90   |  48.1M  | 0  | [download here](https://drive.google.com/file/d/1kUBrAbAQfMT5FQJprITRxDtOE6ECZM0M/view?usp=sharing) |  |

2. DeepViTs with CNNs for patch processing and optimized training hyper-parameters

| Model        | Re-attention | Top1 Acc (%) | #Params | Image Size |  Checkpoint | 
| :---         |   :---:         |  :---:   |  :---:  | :---: |  :---:   | 
| DeepViT-16   |  FC + BN  |   82.3   |  24.5M  | 224  | [download here](https://drive.google.com/file/d/1evhBjla4Nth7LawW2PAXnGEcpv3YBWEC/view?usp=sharing)| 
| DeepViT-32   |  FC + BN  |   83.1   |  48.1M  | 224  | [download here](https://drive.google.com/file/d/1MTRm0NK_sPGRSyuD_hHJ1Zgw2diEaKLR/view?usp=sharing)| 
| DeepViT-32 | FC  + BN  |   84.25   |  48.1M  | 384  | [download here](comming soon) | 

## Data Preparing
### Preparing ImageNet
Download the ImageNet dataset from http://www.image-net.org/
Then, and move validation images to labeled subfolders, using the following [shell script](https://raw.githubusercontent.com/soumith/imagenetloader.torch/master/valprep.sh) by putting this shell script into the directory of $ImageNet Root$/ILSVRC/Data/CLS-LOC/val and running it.
### Convert ImageNet dataset into LMDB (Lightning Memory-Mapped Database) Dataset
python ./timm/data/lmdb_dataset.py --src_dir $ImageNet Root$/ILSVRC/Data/CLS-LOC/ --dst_dir ../dataset_lmdb
### Download pre-trained model
Download the pre-trained model checkpoints as listed above into the directory of ./chekcpoint.

## Evaluation
To evaluate a pre-trained DeepViT models on ImageNet val run:

```
bash eval.sh
```

## Citing DeepVit

```
@article{zhou2021deepvit,
  title={DeepViT: Towards Deeper Vision Transformer},
  author={Zhou, Daquan and Kang, Bingyi and Jin, Xiaojie and Yang, Linjie and Lian, Xiaochen and Hou, Qibin and Feng, Jiashi},
  journal={arXiv preprint arXiv:2103.11886},
  year={2021}
}
```




