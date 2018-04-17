# This is a comment

FROM ubuntu:latest
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
MAINTAINER Steve Tsang <mylagimail2004@yahoo.com>
RUN apt-get update

RUN apt-get install --yes \
 build-essential \
 wget \
 unzip \ 
 python-numpy \
 python-scipy \
 python-matplotlib \
 mercurial 


#Run IT mode
#wget https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh
#bash Anaconda2-4.3.0-Linux-x86_64.sh 
#conda install bowtie2

RUN wget http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.2.5/bowtie2-2.2.5-linux-x86_64.zip
RUN unzip bowtie2-2.2.5-linux-x86_64.zip
 
#wget https://bitbucket.org/nsegata/metaphlan/get/default.tar.bz2
#tar xjvf default.tar.bz2
#mv *-metaphlan-* metaphlan



#************

#docker pull quay.io/biocontainers/bowtie2:2.2.4--py27_1
#wget https://bitbucket.org/nsegata/metaphlan/get/default.tar.bz2
#tar xjvf default.tar.bz2
#mv *-metaphlan-* metaphlan


apt-get install python-numpy python-scipy python-matplotlib
hg clone https://hg@bitbucket.org/nsegata/graphlan
