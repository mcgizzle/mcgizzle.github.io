---
title: ARM-ing Stack with Docker
author: mcgizzle
date: Sep 23rd, 2019
tags: [haskell, arm, docker, stack]
description: Running Haskell on a RaspberryPi using stack & docker.
---

A few months ago my when laptop began to run out of memory, I decided to delete docker and purchase a RaspberryPi to use as a sort of cheap home server for building my docker images on.

I quickly realised that I was naively unaware that Docker is not platform independent. Meaning that x86 based docker images will not run on ARM processors (the underlying tech of Pis). This rendered all of my existing images useless on my new Pi.

I almost exclusively use Docker for running Haskell so I began searching online for ARM based images, to no avail. Rather than throw in the towel I decided to try and cultivate my own collection of images that would be suitable for ARM.

First I needed a suitable base image. I settled on an Ubuntu image supplied by [arm32v7][https://hub.docker.com/u/arm32v7/]. This is a supported image so is as official as Docker images come.

I next browsed through stacks collection of x86 [Dockerfiles](https://github.com/commercialhaskell/stack/tree/master/etc/dockerfiles/stack-build), and used their approach to create a base Dockerfile followed by a tagged lts-13.3 (as far as I am aware GHC 8.6.3 is the latest version supported on ARM).

Stack requires at least version 6 of LLVM so I added that to the image.
