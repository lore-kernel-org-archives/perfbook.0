Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44834 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726579AbfCSPh2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 19 Mar 2019 11:37:28 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2JFZWfM119348
        for <perfbook@vger.kernel.org>; Tue, 19 Mar 2019 11:37:27 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2rb220m8hx-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 19 Mar 2019 11:37:26 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 19 Mar 2019 15:37:25 -0000
Date: Tue, 19 Mar 2019 08:38:10 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] toolsoftrade: Fix code listing 4.22 in Chapter 4
Reply-To: paulmck@linux.ibm.com
References: <20190319145927.29610-1-kaslevs@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319145927.29610-1-kaslevs@vmware.com>
Message-Id: <20190319153810.GV4102@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Slavomir Kaslev <kaslevs@vmware.com>
Cc: perfbook@vger.kernel.org, rostedt@goodmis.org, slavomir.kaslev@gmail.com

On Tue, Mar 19, 2019 at 04:59:27PM +0200, Slavomir Kaslev wrote:
> Code listing 4.22 is broken since the READ_ONCE() macro takes a rvalue and the
> expression parenthesis are unbalanced. This patch fixes it.
> 
> Signed-off-by: Slavomir Kaslev <kaslevs@vmware.com>

Good eyes, thank you!  Queued and pushed.

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 41605a33..4e0764d0 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -2111,7 +2111,7 @@ Listing~\ref{lst:toolsoftrade:Avoiding Danger, 2018 Style}.
>  \begin{listing}[tbp]
>  \begin{linelabel}[ln:toolsoftrade:Preventing Load Fusing]
>  \begin{VerbatimL}[commandchars=\\\{\}]
> -while (!READ_ONCE((!need_to_stop))
> +while (!READ_ONCE(need_to_stop))
>  	do_something_quickly();
>  \end{VerbatimL}
>  \end{linelabel}
> -- 
> 2.19.1
> 

