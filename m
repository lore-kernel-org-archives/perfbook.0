Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=nLxB8pvmn2gsbH9tZXnwv1xBea2E87RxtPV4xYcB2Yg=;
 b=FD5cWy7y9Gf7o0KiosP+ZxebXbVR3yKWgcbiuxNSPGLlLepXd3C2R013/1Qv1NVCEc
 FCsm6eQFpW2Jkfg1dgV/h1pnqKnHhxeI1u67ctqMn0WSRS0BlR6IWn/rswzKGT4bC8JO
 vLyS9J2vskbStev87opokzHJLP3G6yCHDtMTHOsAurOQPZDYlX1KjMCzZHxvBhNGBKYW
 bRJ27g5fC9QZLDcH5uhNnVMeL61E8blhD92Yc2A1BlXwFvYoxf+aBX1XRFqM5K0gwUOm
 NTbHPlujU3wrBFu2kcw6GxfDg3qcqywt0CtJU1CgF2lNjOV1vKGjmTbhcC13mTbipM8E
 8D4w==
Subject: [PATCH 3/7] bib/RCU: Salvage url of Spraul01
References: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <124cb7f1-f6ec-23d0-fd07-d60c87d0bd7a@gmail.com>
Date: Mon, 23 Jan 2017 00:01:27 +0900
MIME-Version: 1.0
In-Reply-To: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b40043b88d7de2b49031528a239857caa1cc039b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 15 Nov 2016 00:21:50 +0900
Subject: [PATCH 3/7] bib/RCU: Salvage url of Spraul01

This seems to be the message originally cited. But this commit
waits the editor's confirmation.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 8ef8195..29af1c1 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -338,9 +338,9 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
 ,Title="Re: {RFC:} patch to allow lock-free traversal of lists with insertion"
 ,month="October"
 ,year="2001"
-,note="Available:
-\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=100264675012867&w=2}
-[Viewed June 23, 2004]"
+,note="URL:
+\url{http://lkml.iu.edu/hypermail/linux/kernel/0110.1/0410.html}"
+,lastchecked="November 15, 2016"
 }

 @unpublished{LinusTorvalds2001a
-- 
2.7.4


