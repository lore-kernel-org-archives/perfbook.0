Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e35.co.us.ibm.com ([32.97.110.153]:47072 "EHLO
 e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751745AbcBOGND (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 15 Feb 2016
 01:13:03 -0500
Received: from localhost	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 14 Feb
 2016 23:12:59 -0700
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 AFBA63E40030	for <perfbook@vger.kernel.org>; Sun, 14 Feb 2016 23:12:57 -0700
 (MST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1F6CviP28442736	for <perfbook@vger.kernel.org>; Mon, 15 Feb 2016 06:12:57
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1F6CuA9003342	for <perfbook@vger.kernel.org>; Mon, 15 Feb 2016 01:12:56
 -0500
Date: Sun, 14 Feb 2016 22:13:02 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] toolsoftrade: add missed closing parenthesis
Message-ID: <20160215061302.GZ6719@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1455414846-7123-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455414846-7123-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Feb 14, 2016 at 10:54:06AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch, queued!

							Thanx,  Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 8d54d3a..bfe3c52 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -394,7 +394,7 @@ Figure~\ref{fig:toolsoftrade:Threads Created Via pthread-create() Share Memory}
>  The first argument is a pointer to a \co{pthread_t} in which to store the
>  ID of the thread to be created, the second \co{NULL} argument is a pointer
>  to an optional \co{pthread_attr_t}, the third argument is the function
> -(in this case, \co{mythread()}
> +(in this case, \co{mythread()})
>  that is to be invoked by the new thread, and the last \co{NULL} argument
>  is the argument that will be passed to \co{mythread}.
> 
> -- 
> 1.9.1
> 

