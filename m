Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=/kIh17rOkdJLQARM0kciHy6DTzERWF381e3Yduv2XSA=;
 b=lpmgq8CJ3aIABxkICF9fB2g8yD50kx2BRPD310YljxcJOGR8/Uz00csi4FU8+phCsv
 IUFLdEjLUgTMRiXiTb4jqoSROEu0vUaZF9pXt8v2GGXf9mLVXyv0edvS5YsKZfH+iQzA
 ivPazJ0UBafy0MOVEJaeI++6nXI9fNssN2OrXtZRygVOXYl6Z5nrzxjpF2WzDVuOFzVL
 8Nz3T4o0OpRnuahs8rptwsG5IXEYVEwYWiDgGdDitySqotSi5IXLf7i2YNS3O4a+gGW/
 gcXPmXQxpPi9tEAEV4WNmiUff4YMgl8d4GD2K1xm3P3R0rDUoq5KfkF0YhRlAWnt3Beb
 vTIQ==
Subject: [PATCH 4/7] bib/os: Salvage url of Molnar00a
References: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dc2d308e-c608-8b48-afd4-c33f19e583ff@gmail.com>
Date: Fri, 3 Feb 2017 23:08:31 +0900
MIME-Version: 1.0
In-Reply-To: <318f65a9-7bb2-d1bf-0ecd-d78bb58832d8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From aae83629ce48623ca176c3e31310dc9f74f7b1fe Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 14 Nov 2016 00:29:47 +0900
Subject: [PATCH 4/7] bib/os: Salvage url of Molnar00a

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/os.bib | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/bib/os.bib b/bib/os.bib
index 49f2f08..357b6a4 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -748,8 +748,9 @@ on Operating Systems Principles"
 ,Title="brlock"
 ,month="March"
 ,year="2000"
-,note="Available: \url{http://www.tm.kernel.org/pub/linux/kernel/v2.3/patch-html/patch-2.3.49/linux_include_linux_brlock.h.html}
-[Viewed September 3, 2004]"
+,note="URL:
+\url{http://kernel.nic.funet.fi/pub/linux/kernel/v2.3/patch-html/patch-2.3.49/linux_include_linux_brlock.h.html}"
+,lastchecked="November 13, 2016"
 }

 @unpublished{JonathanCorbet2001dyntick
-- 
2.7.4


