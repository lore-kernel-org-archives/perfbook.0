Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52756 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751542AbdISQFr (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 19
 Sep 2017 12:05:47 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8JG5iQH066717
 for <perfbook@vger.kernel.org>; Tue, 19 Sep 2017 12:05:47 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2d35ndk4uy-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 19 Sep 2017 12:05:46 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 19 Sep
 2017 12:05:45 -0400
Date: Tue, 19 Sep 2017 09:05:42 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] memorder: Remove unnecessary comma
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170919153456.10274-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170919153456.10274-1-sj38.park@gmail.com>
Message-Id: <20170919160542.GI3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Sep 20, 2017 at 12:34:54AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued and pushed all three, good eyes, thank you!!!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index f7ec84a..820e718 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1254,7 +1254,7 @@ exists (1:r2=x0 /\ 1:r3=1)
>  \end{listing}
> 
>  Listing~\ref{lst:memorder:Message-Passing Address-Dependency Litmus Test (No Ordering)}
> -(\path{C-MP+o-wmb-o+o-addr-o.litmus}),
> +(\path{C-MP+o-wmb-o+o-addr-o.litmus})
>  shows a linked variant of the message-passing pattern.
>  The head pointer is \co{x1}, which initially
>  references the \co{int} variable \co{y} (line~5), which is in turn
> @@ -1576,7 +1576,7 @@ exists (1:r2=2 /\ 0:r2=2)
>  \end{listing}
> 
>  Listing~\ref{lst:memorder:Load-Buffering Control-Dependency Litmus Test}
> -(\path{C-LB+o-r+o-ctrl-o.litmus}),
> +(\path{C-LB+o-r+o-ctrl-o.litmus})
>  shows another load-buffering example, this time using a control
>  dependency (line~19) to order the load on line~18 and the store on
>  line~20.
> -- 
> 2.10.0
> 

