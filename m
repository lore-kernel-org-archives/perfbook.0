Return-Path: <SRS0=cNLA=GK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4EVXAGmOiz1L+qZBzlqtTE68XVZd3C/kagtBJsdCEcQ=;
        b=cfJUhuu6EAxt8wcv+YJHkVLtnSO+t4+EwiePHZ+uAuJWJDDdcmrk9ioQREQHvhugcv
         Fe8DpNzL6yOdRtX7ra400KMTc2WOD53RsOcA6/m2HLfnryk4VTm6fNc9zhHhHQs5n9FB
         Quw98xjCXUvXxDOj3zLI+FudukkmslJ4MAXSngv7/MQTco4I5MWGau1DnRuf34/k5Ghy
         0YO6fbVqCNMtNYHEp1CV4uRmAA1bAbmwHY3EDBj6VsNCTTRpD2rPFJskxl1Ruaj+Em4M
         APQFaHt+uTuJ1hQUH+31LfAaa2c4rwkdWWY0xstU9O52avkyRrXhpHb3vdpSldbvgXIV
         0WXw==
Subject: [PATCH v2 0/2 -perfbook] Add Dockerfile and Q&A
References: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <37b28839-4534-b567-02e6-2ca4c7afe261@gmail.com>
Date: Thu, 7 Jan 2021 22:49:08 +0900
MIME-Version: 1.0
In-Reply-To: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi,

This is the v2 of the patch set.

The strange -nq build Paul thought he had encountered prompted me
to prepare a Docker image for stable build environment.
Such an environment can be helpful as a contingency plan when
some package's update causes breakage in perfbook's build scripts,
such as the build error recently reported by Dmitry and Felipe.

This patch set adds a Dockerfile I used and a Q&A entry in
FAQ-BUILD.txt.
docker/ subdirectory also holds steel city comic font to be copied
to the image.

Changes v1 -> v2:
  o Add a few ARG commands in Dockerfile for custimizable uid and gid.
  o Entry #14 in FAQ-BUILD.txt recommends the use of -u option to
    use uid:gid of host side.
  o Changed dockerhub repository name to perfbook-build-focal.
  o Reference #14 from #5 in FAQ-BUILD.text

        Thanks, Akira
--
Akira Yokosawa (2):
  Add files to build Docker image for perfbook build
  FAQ-BUILD: Add Q&A on Docker image

 FAQ-BUILD.txt                       |  38 +++++++++++++++++++++++++---
 docker/Dockerfile                   |  21 +++++++++++++++
 docker/steel-city-comic.regular.ttf | Bin 0 -> 23280 bytes
 3 files changed, 56 insertions(+), 3 deletions(-)
 create mode 100644 docker/Dockerfile
 create mode 100644 docker/steel-city-comic.regular.ttf

-- 
2.17.1


