Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:37251 "EHLO
 e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752526AbcBVClE (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 21 Feb 2016
 21:41:04 -0500
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 21 Feb
 2016 00:30:17 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 7D1F138C8039
 for <perfbook@vger.kernel.org>; Sun, 21 Feb 2016 00:30:15 -0500 (EST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1L5UF0E33751052	for <perfbook@vger.kernel.org>; Sun, 21 Feb 2016 05:30:15
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1L5UESA006260	for <perfbook@vger.kernel.org>; Sun, 21 Feb 2016 00:30:15
 -0500
Date: Sat, 20 Feb 2016 21:30:20 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] Let a writer thread go back to the original CPU in
 the toy RCU pseudocode
Message-ID: <20160221053020.GK3522@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1455958322-25225-1-git-send-email-mitake.hitoshi@gmail.com>
 <1455958322-25225-2-git-send-email-mitake.hitoshi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455958322-25225-2-git-send-email-mitake.hitoshi@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Hitoshi Mitake <mitake.hitoshi@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Feb 20, 2016 at 05:52:02PM +0900, Hitoshi Mitake wrote:
> This commit a little bit improves the logic of a writer thread. The
> new logic lets the writer go back to the original CPU after run_on()
> the final CPU.
> 
> Of course it is a trivial improvement and the original two lines
> pseudocode is beautiful. If it isn't worth to apply, please ignore it.
> 
> Signed-off-by: Hitoshi Mitake <mitake.hitoshi@gmail.com>

Hello, Hitoshi,

Thank you for the submission, but each addition of this sort invites
another.  For example, you capture the initial CPU, but suppose that
the thread was originally bound to a pair of CPUs?  Wouldn't you then
want to restore the binding to that pair of CPUs?

But if you did that, suppose that both of those CPUs went offline
while going through the for_each_online_cpu() loop?  Wouldn't you
need to instead bind to some CPUs that were actually online?

And suppose that some other CPU changed the binding of the thread
just after you captured the initial binding?  Wouldn't you want to
reflect that change (give or take CPU hotplug operations) at the
end of the loop?

And it just gets worse from there.  So we need to keep this one
simple, which means that I cannot accept this patch.

							Thanx, Paul

> ---
>  defer/rcuintro.tex | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
> index 03d6e12..135922c 100644
> --- a/defer/rcuintro.tex
> +++ b/defer/rcuintro.tex
> @@ -166,8 +166,11 @@ quite complex, a toy implementation is exceedingly simple:
>  \begin{minipage}[t]{\columnwidth}
>  \scriptsize
>  \begin{verbatim}
> -  1 for_each_online_cpu(cpu)
> -  2   run_on(cpu);
> +  1 int orig_cpu = smp_processor_id();
> +  2 for_each_online_cpu(cpu)
> +  3   run_on(cpu);
> +  4 if (orig_cpu != smp_processor_id())
> +  5   run_on(orig_cpu);
>  \end{verbatim}
>  \end{minipage}
>  \vspace{5pt}
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

