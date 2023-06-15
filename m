Return-Path: <SRS0=Gk1L=CD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686822988; x=1689414988;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBgam3gj2pJ4AvddS8lTG24a9ZSIMaf8w+bRgSpgv7k=;
        b=Ws5MFbcQbXOeYTdbI8cyDLPBJ5HoBiWrWg8zwjOUnRNWn0EL8ypTbWyMJYkaM2mTO3
         Hx9N2PUClwBlXmo0n2c5JDb+4KOJPX+mOxoe2DN2hpPVHHF3y7ZWu/ciImeLm0Vfjddv
         PaKSkibdBvF2cuUBKc67uEi2MHeCBLPUmU2KHGMMaQdqzjmznpJjdkYCt1fTmxoV8jz0
         RzA/mVyPRBDNY7C2XxN1zSCFj1fuc/oF/yotoR20jka2v25ip+sX+ZZhSgq6b7USU/Es
         EvIovDw4Uani4La2knV95eburOwd++67M3V3yJoBChDeqKag4lS84E2SI801o6Z+8O4z
         BAtw==
Message-ID: <22d90cc4-0064-5f28-f499-e9b9d7d9e08a@gmail.com>
Date: Thu, 15 Jun 2023 18:56:24 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 6/6] Dockerfile: Make uid:gid = 0:0 the default
Content-Language: en-US
References: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Most container images at dockerhub and other repositories have
uid:gid = 0:0 by default.
This makes it possible to run commands to update or install packages
after invoking such images.

Furthermore, rootless-mode docker has become easier to install [1]
and podman is rootless by default.

Change the default uid:gid pair to 0:0 in our Dockerfiles.

(Dockerfile.bionic will soon be removed and is not updated here)

Update FAQ-BUILD.txt accordingly. Container images uploaded to
akiyks/perfbook-build will be for rootless mode by default from now
on.

akiyks/perfbook-build-focal and akiyks/perfbook-build-fedora
should be regarded as deprecated but will be kept for a while.

Link: [1] https://docs.docker.com/engine/security/rootless/
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt            | 27 ++++++++++++---------------
 docker/Dockerfile        |  4 ++--
 docker/Dockerfile.fedora |  4 ++--
 3 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index e0fa0847fd53..5867acd9d4d3 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -40,7 +40,7 @@
 		Alternatively, you can use the container image described
 		in #13 below.  Otherwise, instructions follow.
 
-		On Ubuntu Bionic and Focal, the following list should cover
+		On Ubuntu Bionic and later, the following list should cover
 		necessary packages (except for -doc packages):
 			texlive-publishers texlive-pstricks
 			texlive-science texlive-fonts-extra
@@ -296,42 +296,39 @@
 		subdirectory.  You can pull the container image built from
 		it as follows:
 
-		    docker pull akiyks/perfbook-build-focal:latest
+		    docker pull akiyks/perfbook-build:latest
 
 		It can be run with the command:
 
 		    docker run --rm -it -v <path to perfbook dir>:/work \
-		      akiyks/perfbook-build-focal:latest
+		      akiyks/perfbook-build:latest
 
 		Note:
-		The prebuilt container image assumes <uid:pid> = <1000:1000>.
-		If you have different IDs, you can still run the image by
+		The prebuilt container image assumes rootless mode.
+		If you run root-mode docker, you can still run the image by
 		adding the option:
 
 		     -u $(id -u):$(id -g)
 
-		to the "docker run" command.  The bash prompt will be in the
-		form of "I have no name!@abcdef012345:/work$".	Builds of
-		perfbook will nevertheless succeed.  You can also build
-		a container image of your own:
+		to the "docker run" command.
+
+		You can build a container image on your own:
 
 		    cd docker
 		    docker build -t <container image tag> \
 		      --build-arg uid=$(id -u) --build-arg gid=$(id -g) .
 
 		For those prefer a Fedora-based container image,
-		akiyks/perfbook-build-fedora:latest is also available.
+		akiyks/perfbook-build:fedora is also available.
 		It is built from docker/Dockerfile.fedora.
 
 		If you have podman already installed, you can run the image
-		with podman. podman maps container's root to your host uid
-		by default.
-		Use the following command to run:
+		with podman. podman runs in rootless mode by default.
+		Use the following command to run (Note the ":z" in the -v flag):
 
 		    podman run --rm -it -v <path to perfbook dir>:/work:z \
-		      -u 0:0 akiyks/perfbook-build-fedora:latest
+		      akiyks/perfbook-build:fedora
 
-		You will see a prompt with a "#".
 		Your updates under /work will have your host uid in host's POV.
 
 14.	It looks as if answers above all assume building under GNU/Linux
diff --git a/docker/Dockerfile b/docker/Dockerfile
index b11116493c6d..ec89c6f266dd 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -17,8 +17,8 @@ WORKDIR /opt
 RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
     sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-*/latexpand && \
     cp latexpand-*/latexpand /usr/local/bin
-ARG uid=1000
-ARG gid=1000
+ARG uid=0
+ARG gid=0
 ARG user=perfbook
 ARG group=perfbook
 RUN if [ $uid -ne 0 ] ; then \
diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index 9b5ed5440869..5eff2a2a00cd 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -22,8 +22,8 @@ WORKDIR /opt
 RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
     sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-*/latexpand && \
     cp latexpand-*/latexpand /usr/local/bin
-ARG uid=1000
-ARG gid=1000
+ARG uid=0
+ARG gid=0
 ARG user=perfbook
 ARG group=perfbook
 RUN if [ $uid -ne 0 ] ; then \
-- 
2.25.1


