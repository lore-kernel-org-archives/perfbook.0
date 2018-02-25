Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33182 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751738AbeBYWiP (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 25
 Feb 2018 17:38:15 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w1PMYpI6092176
 for <perfbook@vger.kernel.org>; Sun, 25 Feb 2018 17:38:15 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2gbu36x98v-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 25 Feb 2018 17:38:15 -0500
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 25 Feb
 2018 17:38:13 -0500
Date: Sun, 25 Feb 2018 14:38:39 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Fix Paul's grammar for Communcation Miss Definition in
 glossary.tex
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180225041324.11085-1-xerofoify@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180225041324.11085-1-xerofoify@gmail.com>
Message-Id: <20180225223839.GG2855@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Nicholas Krause <xerofoify@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Feb 24, 2018 at 11:13:24PM -0500, Nicholas Krause wrote:
> This fixes Paul's or whoever wrote the glossary.tex file to
> use proper grammar on line 21 by changing the some to some
> other CPU to avoid a grammar mistake.
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>

Good eyes!  Pulled with a rework of the commit log.

							Thanx, Paul

> ---
>  glossary.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/glossary.tex b/glossary.tex
> index 1b9db25..9bd4024 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -128,7 +128,7 @@
>  	by increasing ``lock contention'').
>  	Contrast with ``data locking''.
>  \item[Communication Miss:]
> -	A cache miss incurred because the some other CPU has written to
> +	A cache miss incurred because some other CPU has written to
>  	the cache line since the last time this CPU accessed it.
>  \item[Critical Section:]
>  	A section of code guarded by some synchronization mechanism,
> -- 
> 2.14.1
> 

