The output of "run_analysis.R" ("tidy_data.txt"), contains the following variables:

1. subject: id number of each participant, takes values between 1 and 30;

2. activity: a descriptive factor name for each activity, takes values "LAYING",
"SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", and "WALKING_UPSTAIRS".

3 - 68. Systematic measurement names in the following format

TypeMeasurement.Statistic-Axis

where

Type - either Gravity or Body for gravity acceleration, body acceleration, or body
angular velocity

Measurement - either Acc or Gyro for acceleration (measured in g) or angular velocity
(measured in radians/second)

Statistic - either mean() for mean or std() for standard deviation.

Axis - either X, Y, or Z for one of three axes of movement