# Video Data Augmentation

This code provides video data augmentation functionality using OpenCV and NumPy, designed to integrate into larger projects that require video preprocessing. It performs brightness adjustments and flip transformations to create an augmented dataset.

## Code Overview

The main functionalities of this code include:

- **Brightness Adjustments**: Applies three levels of brightness augmentation to enhance data variability.
- **Flip Transformations**: Generates horizontally and vertically flipped versions of each video.
  
The code is organized with the following main components:

1. **`BrightnessAdjuster` class**: Uses the HSV color space to adjust the brightness of video frames at defined levels.
2. **Data Augmentation Functions**: Contains the `brighten` function, which performs pixel intensity clipping for brightness control.
3. **Batch Processing in `main_augment.py`**: Uses a list of directories and processes videos within each directory by applying augmentations (brightness and flips).

## File Structure

- **`VideoProcessor.py`**: Contains classes and methods that implement augmentation logic, including brightness adjustment and flipping.
- **`BrightnessAdjuster.py`**: Defines the `BrightnessAdjuster` class for brightness augmentation.
- **`main_augment.py`**: Script for running batch processing on directories of videos, applying all augmentations specified in `VideoProcessor`.
- **`perform_augmentation.sh`**: SLURM job script for submitting jobs on HPC systems, handling environment setup and job submission.
- **`requirements.txt`**: Lists required Python packages (OpenCV and NumPy).
- **`README.md`**: Documentation for setup and usage (this file).

## Setup and Installation

### 1. Install Dependencies

The following dependencies are required for this code:

- **OpenCV** (`opencv-python-headless`) for video processing.
- **NumPy** for numerical operations.

Install the dependencies from `requirements.txt`:

```bash
pip install -r requirements.txt
```

### 2. Configure Paths in main_augment.py
In main_augment.py, specify the directories containing the videos to be processed by adding them directly to the `directory` list varible.

For each directory listed, augmented videos will be saved in a corresponding output folder named <directory>_augmented.

Example configuration in main_augment.py:

directories = [
    "/path/to/your/video_directory1",
    "/path/to/your/video_directory2",
]

### 3. Run the Code
Execute main_augment.py to apply brightness adjustments and flips to all videos within each specified directory.

```bash
python main_augment.py
```

### Augmentation Techniques
#### Brightness Adjustment
The BrightnessAdjuster class and brighten function perform brightness adjustments. Within each video processing loop:

- Three Brightness Levels: The code applies three distinct brightness levels to each video, creating multiple brightness-augmented versions.

#### Flip Transformations
Both horizontal and vertical flips are applied using cv2.flip:

- Horizontal Flip: Creates a horizontally mirrored version of each video.
- Vertical Flip: Generates a vertically mirrored version.

### Example Output
Augmented videos are saved in the output directory with naming conventions that specify each applied transformation:

- Brightness Levels: *_bright1.mp4, *_bright2.mp4, *_bright3.mp4
- Flip Transformations: *_flip_h.mp4 (horizontal) and *_flip_v.mp4 (vertical)

### Optional: Running with SLURM
For HPC environments, `install_packages.sh` and `perform_augmentation.sh` automate environment setup and running the augmentation job.

Submit the job with:
```bash
sbatch install_packages.sh
```

```bash
sbatch perform_augmentation.sh
```