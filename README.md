*Finding Lane Lines on the Road** 
[![Udacity - Self-Driving Car NanoDegree](https://s3.amazonaws.com/udacity-sdc/github/shield-carnd.svg)](http://www.udacity.com/drive)

<img src="examples/laneLines_thirdPass.jpg" width="480" alt="Combined Image" />

Overview
---

This project belongs to my work towards Udacitys 'Self-Driving Car Engineer' Nanodegree. The general project goal is to detect lane lines in images using Python and OpenCV. A description of my implementation can be found below the original project description. The code is included in the Python notebook P1.ipynb

To meet specifications in the project, take a look at the requirements in the [project rubric](https://review.udacity.com/#!/rubrics/322/view)

Project
---
This Project contains two part.
- Creating a pipeline for lane detection
- Reflect on the project in a written report 

You will find the pipeline in the jupyter notebook. In the following the report is described.
---
The pipeline contains six steps, to detect the lines.

0. It starts with the original image. 
<img src="test_images/whiteCarLaneSwitch.jpg" width="480" alt="Combined Image" />

1. Then the image gets converted into grey scale to reduce the image information.
<img src="test_images/whiteCarLaneSwitch.jpg_img_grey.png width="480" alt="Combined Image" />

2. In order to create smoother further lines a gussian filter is applied (kernel size=3)
<img src="test_images/whiteCarLaneSwitch.jpg_Gaussian_smoothing.png" width="480" alt="Combined Image" />

3. It follows a canny edge detection with the parameters (low_thresh=60, high_thresh=200 )
<img src="test_images/whiteCarLaneSwitch.jpg_Canny.png" width="480" alt="Combined Image" />

4. To catch the interesting region a mask with the parameter ([(0,imshape[0]),(420, 330), (580, 330), (imshape[1],imshape[0])]]) is applied
<img src="test_images/solidWhiteCurve.jpg_Mask.png" width="480" alt="Combined Image" />

5. In the masked area now the lines getting detected. 
This is happened by transforming into the Hough Space and detecting there the lines. This space is the most common space to detect lines, because the line detection can be independent applied from the light conditions. 
<img src="test_images/whiteCarLaneSwitch.jpg_Run_Hough_transform.png" width="480" alt="Combined Image" />

6. Final, the detected lines get drawn into the original image
<img src="test_images/whiteCarLaneSwitch.jpg" width="480" alt="Combined Image" />

 Identify any shortcomings
---
The current pipeline shows some minor shortcomings:

- The detection of dashed lines is not as stable as the one of solid lines. The reasons are that the approach uses the longest line as reference and as the car is moving along the dashed line, the reference is continuously changing.

- This approach takes just straight lines into consideration. So, for highway drives this is satisfying solution

Suggest possible improvements
---

- Using a polynomic of a second degree to detect also curves. 
- Plotting the polynomic output instead of a straight line would also lead to a more stable line, because the line hand overs would have a smaller gradient of change.
