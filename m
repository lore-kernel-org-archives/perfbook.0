Return-Path: <SRS0=ReyI=FK=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695728273; x=1696333073; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6w8W9bZkdUSbJdjJMuUE0NYH8fftnYhuNcFBC27pw8=;
        b=UBQpj+hooqvNFsEAFQdpqqdYc4r2FBuVv7faUDA97DFUIa3OaHPsGY5Ppfh6GtuAt+
         XmSAz2g8di4sEznblZT2cUBu4K5ZPcBgCd32XSUKX/WzmQ9KknTWrF/3nZw79ANKmPfZ
         2NY25n/EHwKzbUaCwV32YmzZL1N67IeitTrXJY03RZ5d32Ggk5QIXvZZMZzaiuVeji4z
         jYcO8PaF24SQ3l0RNdB4bGD2xSKF9eGU14RMqoWj8BzChyW0ZcvTvwNKIP+lE/mVvJ/L
         9Pmm9XKNTD+YpN26+Fpojw1e/aowq3wMFrz4X3ELjidXKUJq6km0BoMEAOVf+3gC0VMg
         3LnA==
Message-ID: <2afd9d24-7d59-cff8-8ae3-a43507dd1a6a@gmail.com>
Date: Tue, 26 Sep 2023 20:37:50 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] bib/swtools: Fix bib info of
 JonathanCorbet2019KCSAN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

It looks like most fields were not updated when copy pasted from
JonathanCorbet2016C11atomics in memorymodel.bib.
Replace them with those of named LWN article.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/swtools.bib | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/bib/swtools.bib b/bib/swtools.bib
index 336ea7752743..a4a0fc5c4159 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -899,10 +899,10 @@ numpages = {9}
 @unpublished{JonathanCorbet2019KCSAN,
  Author="Jonathan Corbet",
  Title="Finding race conditions with {KCSAN}",
- month="June",
- day="15",
- year="2016",
- note="\url{https://lwn.net/Articles/691128/}",
+ month="October",
+ day="14",
+ year="2019",
+ note="\url{https://lwn.net/Articles/802128/}",
 }
 
 @article{HoangHaiDang2019RustBeltRelaxed,

base-commit: 5880d52c9646561edc5ba3ff8ec285df75ee370d
-- 
2.25.1

