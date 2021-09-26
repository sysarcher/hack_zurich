# Analysis for PlanetHealth

This directory contains the instructions for setting up the backend on a local dev machine.

## Setup Pre-requisites

### Local Setup (for data cleaning)
Compiled python with `liblzma-dev` installed on your. Python interpreter used: `3.8.2` (though, any interpreter above `3.6.0` should suffice).

Note: `requirements.txt` is a recycled artifact that I have used in other projects (and it contains some security vulnerabilities.)

Note: use a virtualenv!!

```console
$ # inside the virtualenv:
$ pip install -r requirements.txt
```

Now, you should be able to launch and debug `.ipynb` files

### Cluster Setup
We use Zeppelin Notebooks and Flink for the big-data analytics. Although, on a head-to-head comparison with the amount of data we have, distributed data frameworks will fail to scale. But, this should work out in principle.

Note: Using `pandas` in a big-data environment may be a big overhead though trade-offs are always subjective. I chose to use `pandas` because the speed of development and re-use with IPython/Jupyter is immense.

Note: Zeppelin is "fairly" reliable.

Note: Used flink-1.13.2 with Zeppelin 0.10.

To run a 'single-node' cluster, use Docker. We need to download the Flink seperately and provide the binaries

```console
$ wget https://archive.apache.org/dist/flink/flink-1.13.2/flink-1.13.2-bin-scala_2.11.tgz
$ tar zxvf flink-1.13*.tgz
$ cd flink-1.13.2
$ docker run -u $(id -u) -p 8080:8080 -p 8081:8081 --rm -v `pwd`:/opt/flink -e FLINK_HOME=/opt/flink  --name zeppelin apache/zeppelin:0.10.0
```

## Running Software
The major part was done in an IPython/Jupyter notebook on VS Code. Though any Jupyter environment will work.

The data analysis using Jupyter helped immensely in porting the code to Zeppelin/flink. (Flink port is incomplete and left for later.)