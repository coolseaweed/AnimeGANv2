# AnimeGANv2   

## Requirements  
- python 3.6  
- tensorflow-gpu 
   - tensorflow-gpu 1.8.0  (ubuntu, GPU 1080Ti or Titan xp, cuda 9.0, cudnn 7.1.3)  
   - tensorflow-gpu 1.15.0 (ubuntu, GPU 2080Ti, cuda 10.0.130, cudnn 7.6.0)  
- opencv  
- tqdm  
- numpy  
- glob  
- argparse  
  
## Usage  

### 1. Download vgg19    
  > [vgg19.npy](https://github.com/TachibanaYoshino/AnimeGAN/releases/tag/vgg16%2F19.npy)  

### 2. Download Train/Val Photo dataset  
  > [Link](https://github.com/TachibanaYoshino/AnimeGAN/releases/tag/dataset-1)  

### 3. env setup
```bash
# training
docker-compose up -d
```

### 3. Do edge_smooth  
  > `python edge_smooth.py --dataset Hayao --img_size 256`  
  
### 4. Calculate the three-channel(BGR) color difference  
  >  `python data_mean.py --dataset Hayao`  
  
### 5. Train  
```bash
CUDA_VISIBLE_DEVICES="0" python main.py --phase train --dataset <dataset dir> --epoch 101 --init_epoch 1
ex)  python main.py --phase train --dataset dataset/picture/Hayao --epoch 101 --init_epoch 1

# For light version:
python main.py --phase train --dataset <dataset dir> --light --epoch 101 --init_epoch 1
```

### 6. Extract the weights  
```bash
# extract only generator checkpoint
python get_generator_from_ckpt.py --checkpoint_dir <ckpt_dir> --output_dir <output_dir>

# convert generator checkpoint to pb file
python ckpt2pb.py --ckpt_dir <ckpt dir> --ckpt_prefix <ckpt file prefix> --output_dir <output_dir>
ex) python ckpt2pb.py --ckpt_dir models/generator/AnimeGANv2_Hayao_lsgan_300_300_1_2_10_1 --ckpt_prefix model-101.ckpt 

```

### 7. Inference      
```bash
# checkpoint test
python test.py --checkpoint_dir <ckpt dir> --test_dir <src dir> --output_dir <output dir>

# pb test
python tools/infer_pb.py --pb_path <pb directory> --img_path <src img> --out_path <out img>

# convert video
python video2anime.py  --video <video_path> --checkpoint_dir <ckpt_dir> --output_dir <output_dir>
```
