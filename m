Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=qHMgNtbcUYFzR1Y1+1WsGeMSjdg2ccVzveI7GlMOAHo=;
 b=tTTruIgUfuz1VnwWjaYkqcMvMvjHqbA6p/NlEh0IvCgiqAWDS5J0M/pCrYta5cNH7I
 Cb0OsS64bdnlZuKWeGkoxEFnDcNPINrZogeRNg0jzSgDFDIP5hnleTw91/is6X5uhQ8S
 MDM2SZ7S2sDbM6+1SRAsYpIEQg/XE5Qk6a15PaXUwo+45zu+dExemWtWoap5CC6EJLdw
 9U2ORHH0UDrxmg+ZYbbWyg/Wmz8Trd71bkEkpyKydK0HucJgBlD119BZN2iFk5RFnHhg
 j+SbXmWjqh1rau8PLIgMRC1RRi0Rv30jTOUUGSsYxZMQljd7u3/mhXgESmOClI2+otmy
 j5QQ==
Subject: [PATCH 2/5] formal/ppcmem: Avoid break-line after 'lines' in source
References: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fb720298-2549-45cf-c95b-404a64f3177e@gmail.com>
Date: Tue, 9 Aug 2016 00:03:47 +0900
MIME-Version: 1.0
In-Reply-To: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 27111136894e2086427460036d1002179bd6aad2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 5 Aug 2016 07:24:29 +0900
Subject: [PATCH 2/5] formal/ppcmem: Avoid break-line after 'lines' in source

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/ppcmem.tex | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 8fb1dd9..cf637ad 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -133,8 +133,9 @@ in actual use.
 } \QuickQuizEnd

 Lines~8-17 are the lines of code for each process. A given process
-can have empty lines, as is the case for P0's line~11 and P1's lines
-12-17. Labels and branches are permitted, as demonstrated by the branch
+can have empty lines, as is the case for P0's line~11 and P1's
+lines~12-17.
+Labels and branches are permitted, as demonstrated by the branch
 on line~14 to the label on line~17. That said, too-free use of branches
 will expand the state space. Use of loops is a particularly good way to
 explode your state space.
-- 
1.9.1


