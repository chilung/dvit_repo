# ./distributed_train.sh 1 ../dataset_lmdb -c scripts/DeepViT_L_CNN_patch.yaml  --eval-only
./distributed_train.sh 4 ../Dataset/dataset_lmdb -c scripts/DeepViT_24B_pure_transformer.yaml
# ./distributed_train.sh 4 ../Dataset/imagenet/ILSVRC/Data/CLS-LOC -c scripts/DeepViT_24B_pure_transformer.yaml
