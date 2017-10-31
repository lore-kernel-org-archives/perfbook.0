Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37188 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751422AbdJaDuP (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 30
 Oct 2017 23:50:15 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9V3mnmT015427
 for <perfbook@vger.kernel.org>; Mon, 30 Oct 2017 23:50:14 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dxg6u4h8y-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 30 Oct 2017 23:50:14 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 30 Oct
 2017 23:50:13 -0400
Date: Mon, 30 Oct 2017 20:50:09 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Add one solution for one snippet
Reply-To: paulmck@linux.vnet.ibm.com
References: <9307038d-60f1-0c93-55a1-f3c9be35605c@gmail.com>
 <20170917010730.GY3521@linux.vnet.ibm.com>
 <e802cd64-22d9-7ef4-a2b8-95d4779d6c3d@gmail.com>
 <20170917215508.GD3521@linux.vnet.ibm.com>
 <fb1ab164-36a7-1ed7-4eea-5668f5ada155@gmail.com>
 <20171030181423.GA3659@linux.vnet.ibm.com>
 <b067fb63-43b7-a8a4-7bdd-3cd79b839d5c@gmail.com>
 <70204d71-e19e-4bb6-8064-984550c38456@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70204d71-e19e-4bb6-8064-984550c38456@gmail.com>
Message-Id: <20171031035009.GG3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Tue, Oct 31, 2017 at 11:14:47AM +0800, Yubin Ruan wrote:
> >From 256adc5ccd239288c3f38cd193072d6666ab1e82 Mon Sep 17 00:00:00 2001
> From: Yubin Ruan <ablacktshirt@gmail.com>
> Date: Tue, 31 Oct 2017 11:12:03 +0800
> Subject: [PATCH] memorder: Add one solution for one snippet
> 
> Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>
> ---
>  memorder/memorder.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index f8886b4..a1c96df 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3055,6 +3055,8 @@ surprise to \co{do_something()}.\footnote{
>  	Tracking down the bug consumed a holiday weekend not just
>  	for your editor, but also for several of his colleagues.
>  	In short, this is not a new problem.}
> +In this case, \co{tmp} should be declared as \co{volatile} to prevent
> +the transformation by the compiler.
> 
>  Compilers can also fuse stores.
>  The most infamous example is probably the progress-bar example

Declaring tmp as volatile could in some sense solve the problem, but at
the expense of preventing the compiler from caching tmp in a register.
It is better to use READ_ONCE() on the initial read from p, or failing
that, to declare p (not tmp) volatile.

							Thanx, Paul

------------------------------------------------------------------------

commit d1f08db32120f079da699c9deebde22af96a202a
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Mon Oct 30 20:44:33 2017 -0700

    memorder: Show how to use READ_ONCE() to prevent load replication
    
    Reported-by: Yubin Ruan <ablacktshirt@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index f8886b42468c..a3b8f7c86946 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3055,6 +3055,21 @@ surprise to \co{do_something()}.\footnote{
 	Tracking down the bug consumed a holiday weekend not just
 	for your editor, but also for several of his colleagues.
 	In short, this is not a new problem.}
+To prevent the compiler from replicating the load, use \co{READ_ONCE()},
+for example as follows:
+
+\vspace{5pt}
+\begin{minipage}[t]{\columnwidth}
+\scriptsize
+\begin{verbatim}
+  1 tmp = READ_ONCE(p);
+  2 if (tmp != NULL && tmp <= q)
+  3   do_something(tmp);
+\end{verbatim}
+\end{minipage}
+\vspace{5pt}
+
+Alternatively, the variable \co{p} could be declared \co{volatile}.

 Compilers can also fuse stores.
 The most infamous example is probably the progress-bar example

