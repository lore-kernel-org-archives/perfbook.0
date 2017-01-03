Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57222 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1758186AbdACTeE (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 3
 Jan 2017 14:34:04 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id v03JSrGD048426
 for <perfbook@vger.kernel.org>; Tue, 3 Jan 2017 14:32:49 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 27rcgt07sh-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 03 Jan 2017 14:32:48 -0500
Received: from localhost by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 3 Jan 2017
 12:32:48 -0700
Date: Tue, 3 Jan 2017 11:32:44 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] toolsoftrade: Add suffix `()` to function name
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170103185953.3000-1-sj38.park@gmail.com>
 <20170103185953.3000-2-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170103185953.3000-2-sj38.park@gmail.com>
Message-Id: <20170103193244.GZ3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 04, 2017 at 03:59:53AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Both queued and pushed, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 899ef01e6e2a..bc51437eb141 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1383,7 +1383,7 @@ initialization code.
> 
>  The Linux kernel uses
>  \co{struct task_struct} pointers to track kthreads,
> -\co{kthread_create} to create them,
> +\co{kthread_create()} to create them,
>  \co{kthread_should_stop()} to externally suggest that they stop
>  (which has no POSIX equivalent),
>  \co{kthread_stop()} to wait for them to stop, and
> -- 
> 2.10.0
> 

