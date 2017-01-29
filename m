Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=4qPqT8s+QHBnZXON6ljZi1JrOFdPBQpl7E4fe+R10YY=;
 b=AVU+fSzcZfNj5TebM79rzjws0GzPQ2mBsQKbergzqNQFT6ZA23ICkb2Jdhtl/rfgfg
 8+Tr/s0vtWeoE9OgZ1NdURfbqU2rokblVZx8xqzLiq0H2qSdtfUq+uLOtBGx+PXsBzf0
 qhosRLXo7Hu0kdDS3G7Oq25TgU2+vBOocbDkQhNBwD6rc9gVvygOr2Lmn5iXx/QkeRqo
 e4k8O0l49p7TfjT0FxZ35bTPG/3cJD58GXhRow0/g3+s3goNIuoowLFkr9h4ZcAjX0Ty
 VRUHxCa49sd4/bo+Ndv/cxSebVQvy1rhKH7etNdfeEv5mUJIqJCMBap160NjIWVOXn3p
 4vmw==
Subject: [PATCH 3/8] bib/WFS: Add doi to Herlihy93
References: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <14ae42a8-a726-d422-0d3f-9fa75b00af38@gmail.com>
Date: Mon, 30 Jan 2017 00:29:56 +0900
MIME-Version: 1.0
In-Reply-To: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 37c4141719c8771582a7b5c0b072a9493979307c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Nov 2016 08:45:11 +0900
Subject: [PATCH 3/8] bib/WFS: Add doi to Herlihy93

Also fix the title to match the article.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/WFS.bib | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bib/WFS.bib b/bib/WFS.bib
index 43dfe3d..a6f76b8 100644
--- a/bib/WFS.bib
+++ b/bib/WFS.bib
@@ -60,13 +60,14 @@ and Practice of Parallel Programming"

 @article{Herlihy93
 ,author="Maurice Herlihy"
-,title="Implementing Highly Concurrent Data Objects"
+,title="A Methodology for Implementing Highly Concurrent Data Objects"
 ,Year="1993"
 ,Month="November"
 ,journal="{ACM} Transactions on Programming Languages and Systems"
 ,volume="15"
 ,number="5"
 ,pages="745-770"
+,doi="10.1145/161468.161469"
 }

 @techreport{JohnsonLockFreePerf93
-- 
2.7.4


