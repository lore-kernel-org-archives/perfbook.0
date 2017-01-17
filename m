Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=72ANMoc/BYFrhxwGfSesZV0oPLb5w2zKgAZi2ddnShI=;
 b=uJqADxpt5dyLI1Jah2oPlniC5vHKhZjzOMw1zu5zYjobJ6A7g5gkkjbYyTg7jk8VN/
 pYPNVsGKw/rzRU95+bvla3IHpQuTFV2g8iw5jAWoXUNtlHq3XR8fPuC1MdO1Ic5QsO14
 FzUpfflyfmZepj1Z+nzxB76KGLztQ1iOoJlCN0JMMTG/itvjImHlioQFAHuM6Eb38dDL
 pQJH07Dh3p+jvdkm9bgM+/0536v37RtGABdnpzQpCFbsY+Oc5QZs2xezL1pmP2+rkwyN
 3JiUrLbAmXb1vIShuaoGhdktlIP1/reDGqE6HOz5CRPQIr2hWWQF57NPcP80YomnnJcF
 YtPg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] bib: Replace UTF-8 chars with plain ASCII chars
Message-ID: <2fba7d76-719e-8947-cbc0-ee25040f84f1@gmail.com>
Date: Wed, 18 Jan 2017 00:21:41 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9818f62d94a501d24bb073a6a2127cfe6f2afc10 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 18 Jan 2017 00:08:46 +0900
Subject: [PATCH 0/2] bib: Replace UTF-8 chars with plain ASCII chars

Hi Paul,

I noticed some .bib files which contain UTF-8 encoded characters.
Again, these are patches for bibliography, so they will involve your
manual intervention to apply. Also, as the patches themselves contain
UTF-8 chars, I'm not sure you can apply them as usual.
FWIW, this set is sent in UTF-8 encoding.

Anyway, could you please try them?

                                         Thanks, Akira
--
Akira Yokosawa (2):
  bib/hw: Replace UTF-8 encoded single quote with plain ascii
  bib: Replace UTF-8 chars with plain ascii latex sequences

 bib/RCU.bib      | 2 +-
 bib/TM.bib       | 2 +-
 bib/hw.bib       | 4 ++--
 bib/realtime.bib | 2 +-
 bib/swtools.bib  | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.7.4

