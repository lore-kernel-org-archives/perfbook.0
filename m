Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:49314 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751783AbcDUQ1N (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 21 Apr 2016
 12:27:13 -0400
Received: from localhost	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 21 Apr
 2016 10:27:12 -0600
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 0F85519D8058	for <perfbook@vger.kernel.org>; Thu, 21 Apr 2016 10:15:01 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3LGR9pF32833682	for <perfbook@vger.kernel.org>; Thu, 21 Apr 2016 16:27:09
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3LGR9fK013877	for <perfbook@vger.kernel.org>; Thu, 21 Apr 2016 12:27:09
 -0400
Date: Thu, 21 Apr 2016 09:27:41 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] runlatex.sh: Fix while loop condition
Message-ID: <20160421162741.GB3879@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <5718E390.1090309@gmail.com> <5718E478.3000406@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5718E478.3000406@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 21, 2016 at 11:32:24PM +0900, Akira Yokosawa wrote:
> >From a5cb77713f4720592f75db71394fcad784ca480e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Thu, 21 Apr 2016 22:11:06 +0900
> Subject: [PATCH 2/2] runlatex.sh: Fix while loop condition
> 
> After commit 33b93f8258f5 ("qqz: Cross-link questions and answers"),
> 'make' becomes to terminate prematurely with warning messages such as
> 
> >   Latex Warning: There were undefined references
> >   Latex Warning: There were multiply-defined labels.
> 
> This can be dealt with loosening loop condition in runlatex.sh
> which is given to 'grep' command.
> Also, This commit increases the iteration max count to accommodate
> the required number of 'pdflatex' invocations caused by qqz cross-link.
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>

I pulled this into a test branch, and it seemed to work for me, thank you!
I am running on Ubuntu, any experience on other platforms?

Please see below for a couple of questions.

							Thanx, Paul

> ---
>  utilities/runlatex.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
> index 8d2d77a..15d96c1 100644
> --- a/utilities/runlatex.sh
> +++ b/utilities/runlatex.sh
> @@ -47,7 +47,7 @@ then
>  		echo "No bibliography directory, skipping bibtex."
>  	fi
>  fi
> -while grep -q 'LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.' $basename.log
> +while grep -q 'LaTeX Warning:' $basename.log
>  do
>  	iter=`expr $iter + 1`
>  	echo "pdflatex $iter"

Given the loosening above, should we put a "grep LaTeX Warning:" here,
so that users could interrupt the build if they felt that rerunning
latex wasn't going to help?

> @@ -56,7 +56,7 @@ do
>  	then
>  		echo "----- Fatal latex error, see $basename.log for details. -----"

Also given the loosening above, should there be an "exit 1" here?

>  	fi
> -	if test "$iter" -eq 4
> +	if test "$iter" -eq 5
>  	then
>  		echo "Iteration limit: $iter passes through pdflatex"
>  		exit 1
> -- 
> 1.9.1
> 

