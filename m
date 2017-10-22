Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=U9KnxAtiDPlF7wfhjRxskh8dAbAcbnPASCIbQHlcfSE=;
 b=NzdI2q9NpajM1/P8JZKjIS+SI594A/+SiaATwkc77UgSajbYMj8yKEKHVVDKG6na42
 qjlhQGrMDzyR2K3v/xqtRdrSz6K1slzWYOB92yS3E5lTUORqZRvDZeXd1m9L0qV/YVwH
 FciJT+PrsgvxqzyUOZtS1sFl0EtF+CuWzQz/Fm1F2/Iz0jmu7tesuoJYfRxWtWslKayw
 AMxiIPjyOXDpZ6gRvB0/Ml/mzQBTwglYRBPc2SPiCHCwEnynKL9L8+nK6FE1Rz81JmDT
 5ywLkvyLiTtgcvtHrUflPCcPlU/NC6mTOTP4SiZQlglW7HEBSeAauG+QvYKVUV1rkFz1
 I+Yw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Update table layout
Message-ID: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
Date: Mon, 23 Oct 2017 00:20:14 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d224db4bfed5d4ce0639062a920bafc6f9442e16 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 22 Oct 2017 23:55:49 +0900
Subject: [PATCH 0/5] Update table layout

Hi Paul,

My first idea was to add a make target for "table captions at the top".
But I changed my mind and promoted the layout as default.
Instead, I added a target "perfbook-tcb.pdf" (tcb: Table Caption Bottom),
which keeps the caption at the bottom.

Patch #1 does the change in perfbook.tex and Makefile.

Patches #2 and #3 are minor fixes I noticed while updating tables.

Patch #4 updates most tables to use the new table layout experimented in
Style Guide for a while.  It contains changes to use "S" column specifier
provided by the "siunitx" package.

Patch #5 converts a table into a figure drawn by tabular.

There remains several tables not yet touched. They are complex and large
ones. They need extra work to use the new scheme.

NOTE: Table 13.1 does not contain legends and does not use subscripts
as shown in Table D.5 at the moment. In the text, it looks OK to me.

Thoughts?

      Thanks, Akira
--
Akira Yokosawa (5):
  Move caption of table to top
  Define \twocolumnwidth for 1c layout
  Use \O{} macro for 'order-of'
  Update tables using booktabs and alternate-row coloring scheme
  datastruct: Convert 'NUMA Topology of System Under Test' to figure

 Makefile                           |  6 ++-
 SMPdesign/SMPdesign.tex            | 10 +++--
 advsync/rt.tex                     |  8 ++--
 appendix/questions/after.tex       | 25 +++++++++----
 appendix/styleguide/styleguide.tex | 20 ++++++----
 count/count.tex                    | 54 ++++++++++++++++-----------
 cpu/overheads.tex                  | 76 +++++++++++++++++---------------------
 datastruct/datastruct.tex          | 23 ++++++++----
 defer/rcuapi.tex                   | 16 ++++----
 defer/rcufundamental.tex           | 16 ++++----
 defer/rcuusage.tex                 | 10 +++--
 defer/whichtochoose.tex            | 27 +++++---------
 formal/spinhint.tex                | 68 +++++++++++++++++-----------------
 future/QC.tex                      | 75 +++++++++++++++++++------------------
 memorder/memorder.tex              |  8 ++--
 perfbook.tex                       | 17 +++++++++
 together/refcnt.tex                | 25 +++++++------
 17 files changed, 266 insertions(+), 218 deletions(-)

-- 
2.7.4

