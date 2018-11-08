Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54770 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725972AbeKHQI2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 8 Nov 2018 11:08:28 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA86SiuV142596
        for <perfbook@vger.kernel.org>; Thu, 8 Nov 2018 01:34:30 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2nmch1pr2u-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Thu, 08 Nov 2018 01:34:30 -0500
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 8 Nov 2018 06:34:29 -0000
Date: Wed, 7 Nov 2018 22:34:26 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] memorder: Add a brief description of the use of
 multicopy atomicity
Reply-To: paulmck@linux.ibm.com
References: <1541643691-8116-1-git-send-email-junchangwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541643691-8116-1-git-send-email-junchangwang@gmail.com>
Message-Id: <20181108063426.GC4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Thu, Nov 08, 2018 at 10:21:31AM +0800, Junchang Wang wrote:
> Subsection Multicopy Atomicity is ahead of Subsection Hardware Specifics where
> implementation detail of multicopy atomicity in mainstream architectures is
> presented. So we add (1) a brief description of the use of multicopy atomicity
> in representative architectures and (2) a reference to Table Summary of Memory
> Ordering, in subsection Multicopy Atomicity.
> 
> The description is borrowed from a nice discussion with Paul, which can be found
> at https://www.spinics.net/lists/perfbook/msg01952.html.
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>

Queued and pushed, thank you, Junchang!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index fba49b7..69ce196 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1901,7 +1901,11 @@ Most CPU vendors interested in providing multicopy atomicity have therefore
>  instead provided the slightly weaker
>  \emph{other-multicopy atomicity}~\cite[Section B2.3]{ARMv8A:2017},
>  which excludes the CPU doing a given store from the requirement that all
> -CPUs agree on the order of all stores.
> +CPUs agree on the order of all stores.\footnote{
> +	As of late 2018, ARMv8 and x86 provide other-multicopy atomicity,
> +	IBM mainframe provides fully multicopy atomicity, and PPC does
> +	not provide multicopy atomicity at all. More detail is shown in
> +	Figure~\ref{tab:memorder:Summary of Memory Ordering}.}
>  This means that if only a subset of CPUs are doing stores, the
>  other CPUs will agree on the order of stores, hence the ``other''
>  in ``other-multicopy atomicity''.
> -- 
> 2.7.4
> 

