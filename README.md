# Adaptive-Filter-Algorithms
 Four different adaptive filters were implemented and compared. LMS (Least Mean Squares) and NLMS (Normalized Least Mean Squares) are adaptive filter algorithms used for signal processing and system identification. 


 ![alt text](https://en.wikipedia.org/wiki/Least_mean_squares_filter#/media/File:Lms_filter.svg)
 
- **LMS (Least Mean Squares):** 
  - LMS is a gradient-based adaptive algorithm used to minimize the mean square error between the desired output and the actual output of a system.
  - It updates the filter coefficients iteratively by adjusting them in the direction that minimizes the error between the estimated output and the desired output.
  - LMS is widely used due to its simplicity and low computational complexity.

- **NLMS (Normalized Least Mean Squares):** 
  - NLMS is a variant of LMS that normalizes the step size of the LMS algorithm by dividing it by the norm of the input signal.
  - This normalization prevents the step size from being too large or too small, improving the convergence behavior and robustness of the algorithm.
  - NLMS is particularly useful when the input signal varies in magnitude or when the dynamic range of the input signal is large.

Both LMS and NLMS algorithms are commonly employed in various applications such as adaptive equalization, noise cancellation, echo cancellation, and system identification.




Reference :

    https://en.wikipedia.org/wiki/Gale%E2%80%93Shapley_algorithm
