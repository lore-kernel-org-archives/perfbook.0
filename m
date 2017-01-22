Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=waJ+8o+Kx9EKAHExu2p0CpkPoo8ZdWcsH0P4EdAYvD0=;
 b=iMJmYbCCX4qOSOzSlEXgGvNz+XLQAs2x78qJZ1jao79LiKHm0bbl679W9EjfV+4nZY
 l+9kRYeoBv1tirSb0et87fKPzbLIejQ4Iwzyfp/dn29lMoFmTX4e1nAt0XeoqI0nGcft
 DRY2Bnb7axF7dlukry5luQFN6D3IOe8Ul7B+Pes4BgdtNZJsWWv9STe3MyXUraVeJRd3
 YZ7nD13CW0AYoIAA7rg+3Qvdc8uedPSIys36Zfx7zDsu2eDlxCEMABoNPddfbgGI5Kdb
 0KxuEpLT7LU9j0A/Atm6a1mNx89QK+PBIEemytDhniLSQ/aqMlfWfrW4aVPy3CgIdotU
 W2xg==
Subject: [PATCH 5/7] bib/RCU: Append followup mail's url to LinusTorvalds2001a
References: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1d879c99-40ed-778b-17b9-11dbd4efad5f@gmail.com>
Date: Mon, 23 Jan 2017 00:04:01 +0900
MIME-Version: 1.0
In-Reply-To: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 716d56d3794644f28e58950c890cdb894006f51a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 19 Nov 2016 17:56:43 +0900
Subject: [PATCH 5/7] bib/RCU: Append followup mail's url to LinusTorvalds2001a

This followup mail seems to be more relevant to the context
where it is cited in the perfbook text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 29af1c1..713b0c3 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -348,9 +348,10 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
 ,Title="{Re:} {[Lse-tech]} {Re:} {RFC:} patch to allow lock-free traversal of lists with insertion"
 ,month="October"
 ,year="2001"
-,note="Available:
-\url{http://lkml.org/lkml/2001/10/13/105}
-[Viewed August 21, 2004]"
+,note="URL:
+\url{http://lkml.org/lkml/2001/10/13/105},
+\url{http://lkml.org/lkml/2001/10/13/82}"
+,lastchecked="November 19, 2016"
 }

 @unpublished{Blanchard02a
-- 
2.7.4


