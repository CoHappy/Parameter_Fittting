This is a readme file for the parameter fitting project of the EGFR-FYN system.
The code are mainly written and run by matlab.
The algorithm is standard and decribed as follows.
	1: Build an ODE system according to prior knowledge of the system with some unknown parameters to decide.
	2: Solve the forward model by ode15 solver in matlab, define an error estimator(for example L2 error) to quantify the results.
	3: Sample over the parameter space and choose some 'good' inital values with smaller error.
	4: Based on the gradient calculated by finite difference, we apply GradientDecent(or quasi newtown method if neccessary) to find a local minimal.
	5: Compare over these local minimums to find a 'best fit' results as the global optimal.

PS:There are some 'better' method of course. But they are only 'slightly better' so we choose the simplest one.
Actually, there are no garantee to find a true GlobalOptimal. So what we are doing is to find an 'acceptable' results.

So this algorithm is to test weather a proposed ODE system can match the results of the experiment.
If not, we will try to relax the system. The goal is to find a simple and appropriate sytem to match the main characteristic of the experiment pattern.

This project is still updating till now.
Hope we will find a good result.







