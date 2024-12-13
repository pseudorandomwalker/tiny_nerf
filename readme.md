# tiny_nerf Installation and Usage Guide

## Prerequisites
- A working Conda installation
- PyTorch installed in your Conda environment

## Quick Start (Elephant Dataset)
1. Clone the repository
2. Navigate to the notebook directory
3. Run the notebook - it will use the pre-included elephant dataset by default

## Using Custom Datasets
To use your own 3D models, you'll need to:

1. Generate a dataset in the same format as the elephant dataset using either:
   - The provided Blender script inside the included .blend file
   - The standalone script in `bpy.txt`

## Dataset Generation Details
- The elephant model and its dataset are included in the repository
- For the elephant dataset, you don't need to generate anything - it's ready to use
- The Blender script for generating datasets is provided in two formats:
  - Inside the .blend file
  - As a separate `bpy.txt` file


## esrgan
Real-ESRGAN: Training Real-World Blind Super-Resolution with Pure Synthetic Data

Refer to the Github repo to work on Mac, Ubuntu: https://github.com/xinntao/Real-ESRGAN

To work on Windows follow the following steps:
Requirements:
NVIDIA GPU
Download Anaconda

Installation:
Clone repo Either download this repo manually through the download button on the top right:
git clone https://github.com/xinntao/Real-ESRGAN.git

and enter the folder with the command
cd <your_file_path>/Real-ESRGAN

Install dependent packages:
conda create -n RESRGAN python=3.7
conda activate RESRGAN #activate the virtual environment
conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
pip install basicsr
pip install -r requirements.txt
Download pre-trained models here: https://github.com/bycloudai/Real-ESRGAN-Windows?tab=readme-ov-file#:~:text=trained%20models%20here%3A-,RealESRGAN_x4plus.pth,-and%20put%20it
To obtain video results:
1. So first install ffmpeg to extract frames from videos:
conda install -c conda-forge ffmpeg
2.convert your video into png with the following command. replace out <> with the video name and check the inputs folder:
ffmpeg -i <your_video.format, eg: video.mp4> inputs/<video_name>%d.png
3.Run the pretrained model:
python inference_realesrgan.py --model_path experiments/pretrained_models/RealESRGAN_x4plus.pth --input inputs
4. Check the resulted images in results folder
5. Get the video from frames that were edited by Real ESRGAN:
ffmpeg -i results/<video_name>%d.png -c:v libx264 -vf fps=<your original video's FPS> -pix_fmt yuv420p <video_name>_result.mp4
Your video has been upscaled by 4× and is saved as <video_name>_result.mp4.
If you want to process a different video or image, please make sure to remove all the files from the "📂inputs" folder.
The results that were obtained after the tiny nerf models can be found by the following link:
https://drive.google.com/drive/u/1/folders/1ZOSEmqvUB4t-LSJhtI18G6lYQur5eHDY



## dataset generation
To use the generation script this, prepare a blender file with just the object in the scene, scaled to a height less than 1 meter above the origin, within 1 square meter area centered at the origin. Copy the contents of the bpy.txt file into the blender script editor and run it. This will generate a set of images and camera poses in a folder in the same directory as the blender file.

You may run the tiny_nerf code on this dataset by modifying *npz_file_name* to point to the generated npz file, and running the code.




Credits:
This is a pytorch adaptation of the excellent work done by the authors of the original NeRF paper, and in particular their tiny_nerf implementation here: https://github.com/bmild/nerf/tree/master/tiny_nerf.ipynb
The elephant model used is from blenderkit: https://www.blenderkit.com/asset-gallery-detail/c0b6d003-2d09-417e-859a-0664fa9a4560/
