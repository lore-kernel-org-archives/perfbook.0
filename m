Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e31.co.us.ibm.com ([32.97.110.149]:59490 "EHLO
 e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751845AbcDZPbL (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 26 Apr 2016
 11:31:11 -0400
Received: from localhost	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 26 Apr
 2016 09:31:10 -0600
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 8C14A19D8086	for <perfbook@vger.kernel.org>; Tue, 26 Apr 2016 09:30:33 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3QFUmlK38535378	for <perfbook@vger.kernel.org>; Tue, 26 Apr 2016 15:30:48
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3QFUmgd010615	for <perfbook@vger.kernel.org>; Tue, 26 Apr 2016 11:30:48
 -0400
Date: Tue, 26 Apr 2016 08:31:25 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] count: Fix missed context adjustment
Message-ID: <20160426153125.GE3715@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <e25adb42-263b-b61b-b462-36f26ad1cac2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e25adb42-263b-b61b-b462-36f26ad1cac2@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Apr 27, 2016 at 12:10:39AM +0900, Akira Yokosawa wrote:
> >From 433278e9a753e4d195ad57508ad15e15859f92f2 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Wed, 27 Apr 2016 00:02:33 +0900
> Subject: [PATCH] count: Fix missed context adjustment
> 
> In commit 3540c4cce34d ("Add verbiage for signal-theft limit
> counters."), Figure {Atomic Limit Counter Add, Subtract, and Read}
> was split into two figures, and the first part became Figure
> {Atomic Limit Counter Add and Subtract}.
> However, the decription below the figure has not been modified
> yet.
> This commit adjusts the context.
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>

Good eyes!  Applied and queued, thank you!

							Thanx, Paul

> ---
>  count/count.tex | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index 2c9f071..df76035 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -2195,8 +2195,7 @@ the result.
>  \end{figure}
> 
>  Figure~\ref{fig:count:Atomic Limit Counter Add and Subtract}
> -shows the \co{add_count()}, \co{sub_count()}, and
> -\co{read_count()} functions.
> +shows the \co{add_count()} and \co{sub_count()} functions.
> 
>  Lines~1-32 show \co{add_count()}, whose fastpath spans lines~8-15,
>  with the remainder of the function being the slowpath.
> -- 
> 1.9.1
> 

