Return-Path: <SRS0=pt5h=GN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Y3Fnmd28WxCsolO/q/1Q0/5kTYIENsOlIEheJoRvHiU=;
        b=NV6XbwXrqkUkgEWG4hY2vQEWFf78IT3cFZ5Do2NRFk8jbfhO/PtQqNTjhh+xifOCy+
         pM1KEUgxdxM1uWOAYQblV3Q9aBWfzkuBYRquE6SzY/Fro2fwr7oq3yjkyEnJb2z+uLc4
         ehobQFn7JkJcH4UvpPyiIV7CzfYOo4frxquM6LeRZmpfHGy+2jwYWtf64IqO7TXTDHL0
         0cnF4jmkzcdM62JMA06+5zNk472LQBMv3MUIrYbCs61aIeS07r1eL3d2o+/nXC3YvLx0
         J3ytjse84lHqQqKI8PNm8VVYPP+pkt9pbal5TYi+7haGLw7N5d898+LxDjWDJVTPUs4o
         yQNg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Add Fedora-based Dockerfile
Message-ID: <8643e9db-be44-edd9-df06-c9f87348d669@gmail.com>
Date: Mon, 11 Jan 2021 08:08:39 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d37f98e4ca6cd968af2248d3c719b07ce313a7ec Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 11 Jan 2021 07:57:58 +0900
Subject: [PATCH -perfbook] Add Fedora-based Dockerfile

For those who prefer Fedora, add an alternative Dockerfile as
docker/Dockerfile.fedora and mention it in FAQ-BUILD.txt.
Also add a few commands in the Focal-based Dockerfile.

Other updates in FAQ-BUILD.txt:
  o Add "texlive-collection-fontutils" to the Fedora package list,
    which includes "epstopdf".
  o Omit some options to "docker run" as they are specified in
    both Dockerfiles.
  o For those who prefer "podman", add instructions to use the
    images with podman.
  o Substitutions:
      "Docker container" -> "container image"
      "docker image"" -> "container image"

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt            | 31 +++++++++++++++++++++++--------
 docker/Dockerfile        |  2 ++
 docker/Dockerfile.fedora | 21 +++++++++++++++++++++
 3 files changed, 46 insertions(+), 8 deletions(-)
 create mode 100644 docker/Dockerfile.fedora

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index a590cc77..a7a0711d 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -37,7 +37,7 @@
 
 	A.	The "pdflatex" package is a variant of Don Knuth's
 		digital typesetting program, which you can install.
-		Alternatively, you can use the Docker container described
+		Alternatively, you can use the container image described
 		in #14 below.  Otherwise, instructions follow.
 
 		On Ubuntu Xenial, installing the following set of
@@ -71,11 +71,12 @@
 			texlive-collection-binextra
 			texlive-collection-latexextra
 			texlive-collection-fontsextra
+			texlive-collection-fontutils
 			fig2ps graphviz inkscape
 
 		On other Linux distributions such as RHEL/CentOS and
 		Scientific Linux, where support of TeX Live packages
-		is insufficient, the aforementioned Docker container
+		is insufficient, the aforementioned container image
 		provides the needed support.  Again, see #14 below.
 
 		Of course, you can install upstream TeX Live.
@@ -284,7 +285,7 @@
 	Can't I just use some container image?
 
 	A.	You can find a template Dockerfile under the docker/
-		subdirectory.  You can pull the docker image built from
+		subdirectory.  You can pull the container image built from
 		it as follows:
 
 		    docker pull akiyks/perfbook-build-focal:latest
@@ -292,16 +293,30 @@
 		It can be run with the command:
 
 		    docker run --rm -it -v <path to perfbook dir>:/work \
-		      -u $(id -u):$(id -g) \
-		      akiyks/perfbook-build-focal:latest bash
+		      akiyks/perfbook-build-focal:latest
 
 		Note:
-		The prebuilt Docker image assumes <uid:pid> = <1000:1000>.
+		The prebuilt container image assumes <uid:pid> = <1000:1000>.
 		If you have different IDs, bash prompt will be in the
 		form of "I have no name!@abcdef012345:/work$".	Builds of
 		perfbook will nevertheless succeed.  You can also build
-		a docker image of your own:
+		a container image of your own:
 
 		    cd docker
-		    docker build -t <docker image tag> \
+		    docker build -t <container image tag> \
 		      --build-arg uid=$(id -u) --build-arg gid=$(id -g) .
+
+		For those prefer a Fedora-based container image,
+		akiyks/perfbook-build-focal:latest is also available.
+		It is built from docker/Dockerfile.fedora.
+
+		If you have podman already installed, you can run the image
+		with podman. podman maps container's root to your host uid
+		by default.
+		Use the following command to run:
+
+		    podman run --rm -it -v <path to perfbook dir>:/work:z \
+		      -u 0:0 akiyks/perfbook-build-fedora:latest
+
+		You will see a prompt with a "#".
+		Your updates under /work will have your host uid in host's POV.
diff --git a/docker/Dockerfile b/docker/Dockerfile
index e2d23c77..a5afe6ea 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -18,4 +18,6 @@ ARG user=perfbook
 ARG group=perfbook
 RUN groupadd -g $gid $group && useradd -u $uid -g $gid -m $user
 VOLUME /work
+USER $uid:$gid
 WORKDIR /work
+CMD /bin/bash
diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
new file mode 100644
index 00000000..4a3ab855
--- /dev/null
+++ b/docker/Dockerfile.fedora
@@ -0,0 +1,21 @@
+FROM fedora:latest
+
+RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
+    fig2ps graphviz inkscape make git vim nano \
+    texlive-collection-plaingeneric texlive-collection-binextra \
+    texlive-collection-latexextra texlive-epstopdf texlive-fontools \
+    texlive-newtx texlive-newtxtt texlive-nimbus15 texlive-courier-scaled \
+    texlive-inconsolata texlive-newtxsf texlive-mdsymbol && \
+    dnf clean all && \
+    mktexlsr
+COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
+RUN fc-cache /usr/local/share/fonts/
+ARG uid=1000
+ARG gid=1000
+ARG user=perfbook
+ARG group=perfbook
+RUN groupadd -g $gid $group && useradd -u $uid -g $gid -m $user
+VOLUME /work
+USER $uid:$gid
+WORKDIR /work
+CMD /bin/bash
-- 
2.17.1

