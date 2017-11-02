Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47314 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751830AbdKBWvX (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 2 Nov 2017 18:51:23 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA2MmnaM052593
 for <perfbook@vger.kernel.org>; Thu, 2 Nov 2017 18:51:23 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2e08rvah1d-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 02 Nov 2017 18:51:22 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 2 Nov 2017
 18:51:22 -0400
Date: Thu, 2 Nov 2017 15:51:17 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] locking: fix typo
Reply-To: paulmck@linux.vnet.ibm.com
References: <1509605869-8186-1-git-send-email-vichy.kuo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1509605869-8186-1-git-send-email-vichy.kuo@gmail.com>
Message-Id: <20171102225117.GE3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: pierre Kuo <vichy.kuo@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Nov 02, 2017 at 02:57:48PM +0800, pierre Kuo wrote:
> From: Pierre Kuo <vichy.kuo@gmail.com>
> 
> In 7.1.1.2 Local Locking Hierarchies, below left parenthesis seems
> better to be comma.
> 
> "before invoking the comparison function
> (which is unknown code from qsort()’s perspective,"
> ^^^ change it as comma.
> 
> Signed-off-by: Pierre Kuo <vichy.kuo@gmail.com>

I queued and pushed both, thank you!

On the patch below, I interchanged the comma with the preceding space
character.

							Thanx, Paul

> ---
>  locking/locking.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/locking/locking.tex b/locking/locking.tex
> index 12a0240..5921f50 100644
> --- a/locking/locking.tex
> +++ b/locking/locking.tex
> @@ -327,7 +327,7 @@ But the first thread holds Lock~C, so the second thread's call to
>  Lock~B, resulting in deadlock.
> 
>  In contrast, if \co{qsort()} releases Lock~C before invoking the
> -comparison function (which is unknown code from \co{qsort()}'s perspective,
> +comparison function ,which is unknown code from \co{qsort()}'s perspective,
>  then deadlock is avoided as shown in
>  Figure~\ref{fig:lock:Local Locking Hierarchy for qsort()}.
> 
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

