Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56377 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1045809AbdDWQ0E (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 23
 Apr 2017 12:26:04 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v3NGNx2i110883
 for <perfbook@vger.kernel.org>; Sun, 23 Apr 2017 12:26:03 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2a0mmbj576-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 23 Apr 2017 12:26:03 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 23 Apr
 2017 12:26:01 -0400
Date: Sun, 23 Apr 2017 09:25:59 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] debugging: Add reference to heisenbug discussion section
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170423155220.29222-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170423155220.29222-1-sj38.park@gmail.com>
Message-Id: <20170423162559.GR3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 24, 2017 at 12:52:20AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
>  debugging/debugging.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index 7715cf806c24..e621ebdb540b 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -1401,7 +1401,8 @@ This section describes a number of ways to do just that:
>  Although producing an anti-heisenbug for a given heisenbug is more an
>  art than a science, the following sections give some tips on
>  generating the corresponding species of anti-heisenbug.
> -These are followed by a discussion section.
> +These are followed by a discussion section,
> +Section~\ref{sec:debugging:Heisenbug Discussion}.
> 
>  \subsubsection{Add Delay}
>  \label{sec:debugging:Add Delay}
> -- 
> 2.10.0
> 

