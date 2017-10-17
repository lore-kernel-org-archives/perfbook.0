Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48854 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S934114AbdJQQQl (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue,
 17 Oct 2017 12:16:41 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9HGFOHG157839
 for <perfbook@vger.kernel.org>; Tue, 17 Oct 2017 12:16:41 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2dnjt4972a-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 17 Oct 2017 12:16:41 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 17 Oct
 2017 12:16:40 -0400
Date: Tue, 17 Oct 2017 09:16:37 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 5/5] memorder: Use zSeries name consistently
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171017022054.32680-1-sj38.park@gmail.com>
 <20171017022054.32680-5-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171017022054.32680-5-sj38.park@gmail.com>
Message-Id: <20171017161637.GO3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 17, 2017 at 11:20:54AM +0900, SeongJae Park wrote:
> Table for `Summary of Memory Ordering` is using term `z Systems` while a
> subsection about its description calls it `zSeries`.  Because the
> subsection is referencing the table, it would be confuse.  This commit
> modifies the table to use `zSeries` term consistently.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

I applied the first four, good eyes, thank you!

This one was a problem, and I fixed it only two days ago by changing
the section heading to "z Systems", which is the new name.  So good
catch on the inconsistency, but "z Systems" is the new name.

							Thanx, Paul

> ---
>  memorder/memorder.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 28faeec..df4d74c 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3753,11 +3753,11 @@ dependencies.
>  		\rotatebox{90}{x86}
>  	  \end{picture}
>  	& \begin{picture}(6,60)(0,0)
> -		\rotatebox{90}{z~Systems}
> +		\rotatebox{90}{z~Series}
>  	  \end{picture}
>  	\\
>  	\cmidrule(r){1-2} \cmidrule{3-13}
> -%		 Alpha ARMv8 ARMv7 Itanium MIPS PA-RISC -CPUs PPC SPARC x86 z Systems
> +%		 Alpha ARMv8 ARMv7 Itanium MIPS PA-RISC -CPUs PPC SPARC x86 z Series
>  \cellcolor{white}
>  	Memory Ordering
>  	& Loads Reordered After Loads or Stores?
> -- 
> 2.10.0
> 

