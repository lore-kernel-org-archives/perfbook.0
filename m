Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59532 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752219AbcIDJ4C (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 4 Sep 2016 05:56:02 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u849qTOd063714
 for <perfbook@vger.kernel.org>; Sun, 4 Sep 2016 05:55:46 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 258bnt0vn7-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 04 Sep 2016 05:55:46 -0400
Received: from localhost by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 4 Sep 2016
 03:55:46 -0600
Date: Sun, 4 Sep 2016 02:56:05 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] toolsoftrade: Typo fix
Reply-To: paulmck@linux.vnet.ibm.com
References: <8ea0d045-2f2b-4b4e-5ef5-490944c8ee44@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ea0d045-2f2b-4b4e-5ef5-490944c8ee44@gmail.com>
Message-Id: <20160904095605.GN3663@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 04, 2016 at 08:19:10AM +0900, Akira Yokosawa wrote:
> >From f8e9541c541291726dc7cfa712468546e2795f97 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 4 Sep 2016 08:01:03 +0900
> Subject: [PATCH] toolsoftrade: Typo fix
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, queued, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 130faaf..0782892 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -677,7 +677,7 @@ Finally, lines~44-47 release the lock.
> 
>  Figure~\ref{fig:toolsoftrade:Demonstration of Same Exclusive Lock}
>  shows a code fragment that runs \co{lock_reader()} and
> -\co{lock_writer()} as thread using the same lock, namely, \co{lock_a}.
> +\co{lock_writer()} as threads using the same lock, namely, \co{lock_a}.
>  Lines~2-6 create a thread running \co{lock_reader()}, and then
>  Lines~7-11 create a thread running \co{lock_writer()}.
>  Lines~12-19 wait for both threads to complete.
> -- 
> 1.9.1
> 

