Return-Path: <SRS0=Gk1L=CD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686822484; x=1689414484;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c8vceEfewc/3mh04NdjGfgsGJVQ3ml1ghaV0VGBFF8=;
        b=lNIOTgbjBhKdwBCCTkGKsNBppDS6qdmHETBVclRmzzXrBf/IXJnW0fo9QQjIN3caeb
         qJhjmJZuTom3hEpVN10pv10gTfJHuznElB04mtRcj8v1lnWmdKxJhBU5YKkvHh2LD6jK
         N53bBLvmmoZLjmNTt1Bc4t7otaEuUjgjoCTIjIZskMZt59wYQmIRG2k3Lu55trGIdt52
         05kIobfSP05KYdb/sTPDRrCKTRcKLuw9VPkwbuEVZwmCyalYLQoAyOtuNquI33u6ghN7
         pBBSQJzXxLPYvHFo853PD8ubOZF/l2aJi3dJ7f3dxOJK8N1Hec0baKKDsQPO+GWZQtgq
         X9+g==
Message-ID: <feeecfa4-ed23-bede-5487-49129030431f@gmail.com>
Date: Thu, 15 Jun 2023 18:48:00 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/6] Update Dockerfiles
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Commit a80a57b21a5e ("fixsvgfonts.sh: Convert sans-serif into 'DejaVu Sans'")
assumed that having "DejaVu Sans Mono" is sufficent for "DejaVu Sans".

It turns out that docker/Dockerfile.fedora doesn't cover "DejaVu Sans".
Fedora's dejavu-sans-mono-fonts package doesn't contain "DejaVu Sans Mono"!
There is a meta package of the name dejavu-fonts-all which covers them
both as well as dejavu-serif-fonts.

It also turns out that Answer to #9 in FAQ-BUILD.txt saying:

    As for Ubuntu and Fedora, packages listed in #5 should cover
    all the font families needed.

is wrong on the Fedora front.  DejaVu and Liberation fonts need
font packages dejavu-fonts-all and liberation-fonts.

Furthermore, Fedora 38 (released this April) has a regression of
Inkscape where font markup is corrupted in SVG --> PDF conversion.

So Deckerfile.fedora should stay with Fedora 37 for the moment.

Quick search of upstream Inkscape's issue tracker didn't hit the
font markup regression.  I'll open an issue there unless somebody
else beats me to it.

So, this patch set consists of the following

Patch 1/6 adds check of "DejaVu Sans" as nice-to-have font.

Patch 2/6 updates FAQ-BUILD.txt and Dockerfile.fedora for nice-to-have
font packages.

Patch 3/6 updates Dockerfile.fedora to stay with Fedora 37, using an ARG
variable so that building from fedora:38 can be possible.
It also adds popller-utils to check the font markup info in PDF properties.

Patch 4/6 updates Dockerfile (from ubuntu) so that the default base
image is the "latest" (jammy at the moment).  There is no reason to stick
with focal (20.04).

Patch 5/6 adds poppler-utils to Dockerfile (from ubuntu) to detect
Inkscape regression early in case it actually sneaks in.
(Note: Ubuntu 23.04 is safe at the moment.)

Patch 6/6 changes the default uid:gid pair of container images built
from Dockerfiles to 0:0, which is for rootless mode docker/podman.
Repository at dockerhub for prebuilt images is changed to
akiyks/perfbook-build, where the tags "latest" and "fedora" have
uid:gid pair of 0:0.

        Thanks, Akira
--
Akira Yokosawa (6):
  Makefile: Add 'DejaVu Sans' to nice-to-have fonts
  FAQ-BUILD: Update nice-to-have fonts for SVG figures
  docker/Dockerfile.fedora: Stay with Fedora 37 for the moment
  docker/Dockerfile: Use 'latest' as the default tag
  docker/Dockerfile: Add poppler-utils package
  Dockerfile: Make uid:gid = 0:0 the default

 FAQ-BUILD.txt            | 37 ++++++++++++++++++++-----------------
 Makefile                 | 15 ++++++++++++---
 docker/Dockerfile        |  9 +++++----
 docker/Dockerfile.fedora | 16 +++++++++++-----
 4 files changed, 48 insertions(+), 29 deletions(-)


base-commit: a80a57b21a5e8ea3dfa90471126920a1131682f7
-- 
2.25.1

