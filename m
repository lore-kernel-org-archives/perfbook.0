Return-Path: <SRS0=aLez=2P=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DnFEUJYeGyvWoyIIuSz9KcW7VSzY6afQj8mSh9crm+E=;
        b=BSU7fNW1mU38mRnXa9G4Iv95h4yu0/sRLhzLkYYXuk9XrlHSBwVHxpyBamkmlSlIaQ
         xGl57wbvDMdgtpt87oWNXqGlbCBk8a3rn5DzTRgexKCVPQ1N9bVb9NgZsLGXGZR09stk
         0nd9qvuLNFXYaKQvWj2H2MXRmebyN05pb4BCwdOZLGOiquvDTr6rMeomBhwpqC7P5Wgy
         WGX0KTnawuxEvCKJ4rv4L4BsCrG1QsUXu0vJT5yHxRiCRstWX4vDn/lPuGzBKjuC8alX
         3OsZHwBNtQ223/+L3ULJClYdYeI6VF6uCesQNZlLsmsZZr+1ZkfuoVjbnI6NaQO+mGR1
         4u7g==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook] memorder: fix a line number reference error
Date: Fri, 14 Oct 2022 13:55:43 +0800
Message-Id: <20221014055543.8214-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: perfbook@vger.kernel.org, luyang.co@gmail.com, paulmck@kernel.org, akiyks@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In section 15.2.3, "Listing 15.10 shows how to make this work
reliably on pre-v4.15 Linux kernels running on DEC Alpha, by
replacing line 19' READ_ONCE() with lockless_dereference()"

line 19 should be line 18.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Hi Paul
I like Chapter 15 very much as well as other chapters,
I used to read one paragraph a day when I am travelling ;-)

I think there is a small line number reference error in chapter
15.2.3, ignore me if it is not a error.

Many Thanks
Zhouyi
--
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index c350758d..1839e276 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1279,7 +1279,7 @@ exists (1:r2=x0 /\ 1:r3=1)
 % \path{C-MP+o-wmb-o+ld-addr-o.litmus} available at commit bc4b1c3f3b35
 % ("styleguide: Loosen restriction on comment in litmus test")
 shows how to make this work reliably on pre-v4.15 Linux kernels running on
-DEC Alpha, by replacing \clnref{read}'s \co{READ_ONCE()} with
+DEC Alpha, by replacing \clnref{deref}'s \co{READ_ONCE()} with
 \apikh{lockless_dereference()},\footnote{
 	Note that \co{lockless_dereference()} is not needed on v4.15 and
 	later, and therefore is not available in these later Linux kernels.
-- 
2.34.1

