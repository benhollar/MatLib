# MatLib

MatLib is my personal library of MATLAB functions and utilities. If I'm doing something in MATLAB, the contents of this repository are a staple of my workflow.

I'm happy to open-source this code in case it might be useful to someone else. Feel free to use anything you find in here that you like, I just ask that I'm appropriately attributed for my work. 

## General Structure

MatLib is organized in a series of packages to prevent namespace collisions and to group functions by similar purpose. If you're unfamiliar with MATLAB packages, I highly reccommend reading through MATLAB's own documentation on the subject, [found here](https://www.mathworks.com/help/matlab/matlab_oop/scoping-classes-with-packages.html).

In general, I try to keep cross-dependencies minimal, though even now I can already say with certainty most packages will depend on at least some of the `+util` package.

## Getting Started

Using the library is pretty straightfoward if you're familiar with MATLAB. The bulk of the code was written in R2017a, but I've made efforts to make it backwards compatible with far older versions of MATLAB.

To use the contents of the library, simply ensure the folder containing it is on your MATLAB path. MATLAB will ensure the package and its contents are accessible for you.

## Contributing

I do not currently plan on allowing contributors to this library outside of myself.

However, I am happy to accept issues in the form of bug reports and feature requests. I will always prioritize bug reports over writing new tools; I'm not here to write code *for* you, but I'll make every effort to ensure published code works as it should.

Also, please understand I'm providing this code *for free*. I'll work on this on my own schedule, and I may not deal with every issue. If you need something done urgently, you'll probably have to do it yourself. 

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/benhollar/MatLib/blob/master/LICENSE) file for details


