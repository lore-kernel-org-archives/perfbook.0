Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728356AbgKWVPn (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 23 Nov 2020 16:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606166142;
        bh=IgjWoK2NShvnPxUZXV9H+OztZOVXHVwlL8YF7LXzXEo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=mLVlFwurwR+zAa9NzmCNF84ev3cnb/n9dUR5ex2xPd0PnXuTF8NmPZVnIQoF8t/2L
         SNefzGXkhe3wvCnYS84cXo0ONT85hKphYvKtaL0dOU93XIULv2hkv42/51l6Rx10BW
         YhUrpar2mhj2IUPMZ+zJ9jE8C+ZoxAHiRHQ8y0Q8=
Date: Mon, 23 Nov 2020 13:15:42 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [NOT PULL YET -perfbook] PoC of adding index to perfbook
Message-ID: <20201123211542.GA22898@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <29dc3825-3aa7-2e69-ddde-5de61f7015dc@gmail.com>
 <20201123210621.GD1437@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123210621.GD1437@paulmck-ThinkPad-P72>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Nov 23, 2020 at 01:06:21PM -0800, Paul E. McKenney wrote:
> On Mon, Nov 23, 2020 at 12:14:05AM +0900, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> > So this *not-pull* request is to show you my WIP branch to add indices
> > to perfbook.

And this time with the promised patch.

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/glossary.tex b/glossary.tex
index 386946e..8270945 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -153,7 +153,7 @@
 \item[Direct-Mapped Cache:]\index{Direct-mapped cache}
 	A cache with only one way, so that it may hold only one cache
 	line with a given hash value.
-\item[Embarrassingly Parallel:]\index{Embarrassingly parellel}
+\item[Embarrassingly Parallel:]\index{Embarrassingly parallel}
 	A problem or algorithm where adding threads does not significantly
 	increase the overall cost of the computation, resulting in
 	linear speedups as threads are added (assuming sufficient
@@ -248,7 +248,7 @@
 	used so heavily that there is often a CPU waiting on it.
 	Reducing lock contention is often a concern when designing
 	parallel algorithms and when implementing parallel programs.
-\item[Memory Consistency:]\index{Memory consisitency}
+\item[Memory Consistency:]\index{Memory consistency}
 	A set of properties that impose constraints on the order in
 	which accesses to groups of variables appear to occur.
 	Memory consistency models range from sequential consistency,
@@ -382,7 +382,7 @@
 	as well as its cache so as to ensure that the software sees
 	the memory operations performed by this CPU as if they
 	were carried out in program order.
-\item[Superscalar CPU:]\index{Superscaler CPU}
+\item[Superscalar CPU:]\index{Superscalar CPU}
 	A scalar (non-vector) CPU capable of executing multiple instructions
 	concurrently.
 	This is a step up from a pipelined CPU that executes multiple
