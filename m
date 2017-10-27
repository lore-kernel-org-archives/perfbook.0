Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:48640 "EHLO
 mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751399AbdJ0CZJ (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 26
 Oct 2017 22:25:09 -0400
Received: by mail-pf0-f195.google.com with SMTP id b79so3870899pfk.5 for
 <perfbook@vger.kernel.org>; Thu, 26 Oct 2017 19:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uTBLpYZ+3b31F5Vw2UH5mrPvdpAO5qXZpSxHPHu+z5M=;
 b=tsstplbJL3xYhH2OugdOPt0/bChEsDc90tLZcxiaPS4Uf9mMxjKNBS7+h4s1TBSO9t
 SHXgMXcmIxnv+m1kieFLZunXwpnzy9lIer8IXEW8F0Mikq5JZDCw0RiZpYDsf6H3PHIl
 r55LXvDGtMLWp/Duz2DaExlhe0UpAbOyQsuSkLAUS6hF3K7RyeC1TvvkVGPvQqmL+gZW
 UpoPJybWpTfnr8HUEQ/ehZEDpK5obVUPFWWZP8LKRJ6CE9YGJNWWX+ML0jjmKhPXqUcH
 p+GstV8N1nvkcaXlIx7FVJ99n23EhyAa02pevNvvb7R/wnzQ9W7+4pRSAWTIkXQzqU+g
 rJ3w==
Date: Fri, 27 Oct 2017 17:33:20 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: [PATCH] typo at Chp 7.
Message-ID: <20171027093317.GB8509@HP>
References: <20171027092317.GA8509@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171027092317.GA8509@HP>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

And here are some more modification to some wording in chapter 7, but I am not
sure whether you like it or not.

Anyway, chapter 7 makes me feel good ;-) It makes me know that home-brewing a
lock primitives with atomic instructions(which is what I was doing) is
something that is possible and used in production.

Thanks,
Yubin

diff --git a/locking/locking.tex b/locking/locking.tex
index 14db27d..a9f46f1 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -2166,8 +2166,8 @@ Signal-handler deadlocks can be explicitly avoided as follows:
 	of a signal handler.
 \item	If the application invokes the library function
 	while holding a lock acquired within a given signal
-	handler, then that signal must be blocked every time that the
-	library function is called outside of a signal handler.
+	handler, then that signal must be blocked every time that lock
+    is to be acquired outside of a signal handler.
 \end{enumerate}

 These rules can be enforced by using tools similar to
@@ -2329,7 +2329,7 @@ locking's villainy.
 If there are a very large number of uses of a callback-heavy library,
 it may be wise to again add a parallel-friendly API to the library in
 order to allow existing users to convert their code incrementally.
-Alternatively, some advocate use of transactional memory in these cases.
+Alternatively, some advocate using transactional memory in these cases.
 While the jury is still out on transactional memory,
 Section~\ref{sec:future:Transactional Memory} discusses its strengths and
 weaknesses.
