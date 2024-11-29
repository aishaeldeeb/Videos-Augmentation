from VideoProcessor import VideoProcessor


if __name__ == "__main__":
    # List of directories to process
    directories = [
        "/home/aishaeld/scratch/smart_surveillance_data/videos/train_val/anomaly",
        "/home/aishaeld/scratch/smart_surveillance_data/videos/train_val/non_anomaly"
    ]

    # Loop over the directories and process videos
    for dir in directories:
        processor = VideoProcessor(dir, dir + "_augmented")
        processor.process_videos()


