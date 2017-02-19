Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41288 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751649AbdBSWOM (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 19
 Feb 2017 17:14:12 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1JMDpDU110583
 for <perfbook@vger.kernel.org>; Sun, 19 Feb 2017 17:14:09 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28pp6ktf62-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 19 Feb 2017 17:14:09 -0500
Received: from localhost by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 19 Feb
 2017 15:14:08 -0700
Date: Sun, 19 Feb 2017 14:14:04 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] appendix/whymb: Fix a typo, smb_wmb into smp_wmb
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170217015415.32519-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170217015415.32519-1-sj38.park@gmail.com>
Message-Id: <20170219221404.GL30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Feb 17, 2017 at 10:54:15AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good eyes, applied, thank you!

							Thanx, Paul

> ---
>  appendix/whymb/whymemorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> index 9002047a9878..3a22e46beb0c 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -2265,7 +2265,7 @@ a write to a given MMIO register affects the value that will next be
>  read from {\em some other} MMIO register.
> 
>  It is not clear why SPARC does not define \co{wmb()} to be
> -\co{membar #MemIssue} and \co{smb_wmb()} to be
> +\co{membar #MemIssue} and \co{smp_wmb()} to be
>  \co{membar #StoreStore},
>  as the current definitions seem vulnerable to bugs in some drivers.
>  It is quite possible that all the SPARC CPUs that Linux runs on
> -- 
> 2.10.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

