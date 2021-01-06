Return-Path: <SRS0=bdEo=GJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=3G/xr5ezCZVk+eJWHLjBndGlyxCU8L4UvaVtdZ9YxK0=;
        b=eYHJNjA5OUWo+yA6W8vpaTf4npmUOyWKNyPbbxl7UxDVfkuNmvEFrHxdUdo2tGlYhZ
         pndwG1m3Q3HhyenxEIsuGtpUhrauM95cNgp7Cy49yIgG8lKFYU+S5Dc6vuXs1BhymnI+
         ErelTJGApKH2OBSaNRLZWVezplkxrqHxNPDZJoC+g8fovW/0dTnXY1c942+VMmx7Wdan
         eQRgfvfBNDyQR2NNsCJOkhPdcnXSOvMpfz/Id8N5VUX84CLEGNQtzk8DOj8fmdEfZMse
         qTkJusAvEy6EPZZg+47wjESks0SAVdyoI4XhyewZTM3BDmKuYSRmjz0D+9pzmXsPg3FL
         J2YQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2 -perfbook] Add Dockerfile and Q&A
Message-ID: <63638566-e9e8-4be6-2d25-b0919b3805d1@gmail.com>
Date: Wed, 6 Jan 2021 19:28:52 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Subject: [PATCH 0/2 -perfbook] Add Dockerfile and Q&A

Regarding the strange -nq build result Paul recently encountered,
I prepared a Ubuntu Focal based minimal Docker image to build
perfbook.

This patch set adds a Dockerfile I used and a Q&A entry in
FAQ-BUILD.txt.
docker/ subdirectory also holds steel city comic font to be copied
into the image.

--
Akira Yokosawa (2):
  Add files to build Docker image for perfbook build
  FAQ-BUILD: Add Q&A on Docker image

 FAQ-BUILD.txt                       |  22 ++++++++++++++++++++++
 docker/Dockerfile                   |  16 ++++++++++++++++
 docker/steel-city-comic.regular.ttf | Bin 0 -> 23280 bytes
 3 files changed, 38 insertions(+)
 create mode 100644 docker/Dockerfile
 create mode 100644 docker/steel-city-comic.regular.ttf

-- 
2.17.1

