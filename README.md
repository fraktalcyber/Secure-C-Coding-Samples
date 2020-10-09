# Secure C Coding samples

This repository is intended for testing [Secure C Coding standard](https://wiki.sei.cmu.edu/confluence/display/c/SEI+CERT+C+Coding+Standard) sample code snippets. Copyright and License information for the code snippets can be found in the file license.txt.

The official Secure C coding standard static code analysis test suite can be found from [here](https://github.com/SEI-CERT/scvs).

## Prequisites

The Clang version used for this test was Clang 9. In Ubuntu you need to install _clan-9_ and _clan-tools-9_ packages. Please consult your distribution how to install the packages.

The install instructions for Infer can be found from [here](https://github.com/facebook/infer/blob/master/INSTALL.md).

## Testing

This repository contains three helper scripts to run the tests. The _run-clang.sh_ tests Clang, the _run-infer.sh_ tests Infer and _run-overlap.sh_ runs both Clang and Infer to collect the combined results for both of the scanners.