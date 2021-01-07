Return-Path: <SRS0=cNLA=GK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3dtBzlP2QuNBeNfkvxXi/xCmkESyIkMaCMnrGAJ/K5c=;
        b=F+7sh+6lFxUXCIGePnF1LM6HATpG9hIxiyKXZv0Yynbzk2Bifx7q4ufYmsl1IeR2Bg
         1mJ5RvPWJ/uc8JcuJwA3fYPvDVxr5IAFGng+Bc+b686B+iYv8TPZsKX2iNO2Fr41dSxt
         H+q6ziDLvMypttuaO2o2e+vMrn33Wt55iOrmI4cipl8nAWKiVGcjBDuZgfVxQmdIbFVr
         jlAZtPzPCF2ZLQ3pjNGkGx9eGGB0rqzGYFzmatWcSr+DYoRGHC/JJWf6jKKlYvBivg4i
         2QoKiNvCOynHw7Hdm2BxNjG85otStf18Y94M50OLQJGlzIYWRRLVUsOXq87bOI53T1MB
         NBFg==
Subject: Re: [PATCH v2 0/2 -perfbook] Add Dockerfile and Q&A
References: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
 <37b28839-4534-b567-02e6-2ca4c7afe261@gmail.com>
 <20210107175446.GN2743@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2358d87c-302a-1e75-60b7-43ded524e447@gmail.com>
Date: Fri, 8 Jan 2021 07:44:14 +0900
MIME-Version: 1.0
In-Reply-To: <20210107175446.GN2743@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 7 Jan 2021 09:54:46 -0800, Paul E. McKenney wrote:
> On Thu, Jan 07, 2021 at 10:49:08PM +0900, Akira Yokosawa wrote:
>> Hi,
>>
>> This is the v2 of the patch set.
>>
>> The strange -nq build Paul thought he had encountered prompted me
>> to prepare a Docker image for stable build environment.
>> Such an environment can be helpful as a contingency plan when
>> some package's update causes breakage in perfbook's build scripts,
>> such as the build error recently reported by Dmitry and Felipe.
>>
>> This patch set adds a Dockerfile I used and a Q&A entry in
>> FAQ-BUILD.txt.
>> docker/ subdirectory also holds steel city comic font to be copied
>> to the image.
>>
>> Changes v1 -> v2:
>>   o Add a few ARG commands in Dockerfile for custimizable uid and gid.
>>   o Entry #14 in FAQ-BUILD.txt recommends the use of -u option to
>>     use uid:gid of host side.
>>   o Changed dockerhub repository name to perfbook-build-focal.
>>   o Reference #14 from #5 in FAQ-BUILD.text
>>
>>         Thanks, Akira
> 
> Applied and pushed, thank you!  I did the usual wordsmithing, so please
> let me know if I messed anything up.

Thank you!  Now it looks perfect.

> 
> Showing my ignorance of Docker...
> 
> My guess from reading the FAQ is that the new docker/Dockerfile is
> used to build a new docker image, and that it is not needed by those
> using your akiyks/perfbook-build-focal:latest.  Is my guess correct?

You guessed quite right.
One advantage of docker is that once you pulled my container image,
large layers installing various packages are used unmodified in a
new build.
Building a image with an alternative <uid:gid> pair will take just a
few seconds.
Initial pull of the image can take several minutes or longer depending
on the network bandwidth.

For instructions to install Docker Engine on Ubuntu, see:
https://docs.docker.com/engine/install/ubuntu/.

The command in the FAQ assumes your user id belong to the "docker"
group. Otherwise, every docker command needs "sudo".

One thing you need to care is the disk capacity under /var/lib/docker.

If you are behind a corporate proxy, you need to setup proxy for docker
service. See: https://docs.docker.com/network/proxy/

        Thanks, Akira

> 
> 						Thanx, Paul
> 
>> --
>> Akira Yokosawa (2):
>>   Add files to build Docker image for perfbook build
>>   FAQ-BUILD: Add Q&A on Docker image
>>
>>  FAQ-BUILD.txt                       |  38 +++++++++++++++++++++++++---
>>  docker/Dockerfile                   |  21 +++++++++++++++
>>  docker/steel-city-comic.regular.ttf | Bin 0 -> 23280 bytes
>>  3 files changed, 56 insertions(+), 3 deletions(-)
>>  create mode 100644 docker/Dockerfile
>>  create mode 100644 docker/steel-city-comic.regular.ttf
>>
>> -- 
>> 2.17.1
>>
>>
