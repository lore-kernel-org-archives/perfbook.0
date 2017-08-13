Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/USgztVYMVtDIYAZOS+DruYUKV4a0vKHWS+/jhuYcPE=;
 b=g19hRD+PtgJbYr7fkX81u9HrsDkAV9HIVHaFQumRfWwo5g3D82UorW9fm10mRK92rO
 0POLF8b5HMs56Z79+16Znr2XL0YSVxhqmg8R9FsOAOTm1TPhnFyrh+S8ULQWshrDRqcx
 38h8UAEv1txxHQJMQTq06Tk0oDqqWW+/QA0FlsT78IOlBW/mdfZmKGNYSt7NR7eNIGMj
 1caNeGX0Kl1Pwx6mwdmxNfBRo9F/klHOimREty2/Xm9qoqe1f8KidJ87f47iQRIUlNYi
 5CDqzUXkUbQOe77fOM9CExpKXEguxkJCbzn4gGdoPdWB+Feq8yBdHmGHpa8e1l7OHho5
 45Aw==
Subject: [PATCH 5/5] styleguide: Emphasize source part of epigraph
References: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <de317839-7032-14b1-c81b-9f84aa8d16fe@gmail.com>
Date: Sun, 13 Aug 2017 12:33:09 +0900
MIME-Version: 1.0
In-Reply-To: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 24d4de52c8186c1ec1787e76d13e22646d804a53 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 12 Aug 2017 19:58:22 +0900
Subject: [PATCH 5/5] styleguide: Emphasize source part of epigraph

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 0ab9e68..47251a1 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -4,7 +4,7 @@
 \chapter{Style Guide}
 \label{chp:app:styleguide:Style Guide}
 %
-\Epigraph{De gustibus non est disputandum.}{Latin maxim}
+\Epigraph{De gustibus non est disputandum.}{\emph{Latin maxim}}

 This appendix is a collection of style guides which is intended
 as a reference to improve consistency in perfbook. It also contains
-- 
2.7.4


