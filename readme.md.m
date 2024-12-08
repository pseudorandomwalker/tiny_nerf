To use this, prepare a blender file with just the object in the scene, scaled to a height less than 1 meter above the origin, within 1 square meter area centered at the origin. Copy the contents of the bpy.txt file into the blender script editor and run it. This will generate a set of images and camera poses in a folder in the same directory as the blender file. 

You may run the tiny_nerf code on this dataset by modifying *npz_file_name* to point to the generated npz file, and running the code.


Credits:
This is a pytorch adaptation of the excellent work done by the authors of the original NeRF paper, and in particular their tiny_nerf implementation here: https://github.com/bmild/nerf/tree/master/tiny_nerf.ipynb