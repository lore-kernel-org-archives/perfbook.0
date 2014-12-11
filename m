Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:50618 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1757338AbaLKTcf (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 11 Dec 2014
 14:32:35 -0500
Received: from /spool/local	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 11 Dec
 2014 12:32:34 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id 90DA11FF001D	for <perfbook@vger.kernel.org>; Thu, 11
 Dec 2014 12:21:16 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com
 [9.17.195.167])	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id sBBJWWeF22151280	for <perfbook@vger.kernel.org>; Thu, 11 Dec
 2014 12:32:32 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 sBBJWV2h010095	for <perfbook@vger.kernel.org>; Thu, 11 Dec 2014 12:32:31
 -0700
Date: Thu, 11 Dec 2014 11:32:30 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: perfbook build error
Message-ID: <20141211193230.GM25340@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20141211173210.GE31140@pd.tnic>
 <20141211175248.GK25340@linux.vnet.ibm.com> <20141211190724.GF31140@pd.tnic>
 <20141211191734.GG31140@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141211191734.GG31140@pd.tnic>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: perfbook@vger.kernel.org

On Thu, Dec 11, 2014 at 08:17:34PM +0100, Borislav Petkov wrote:
> Great, this moves the error to the next line:
> 
> ---
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index c98f3a78652f..012f815fdd65 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1242,8 +1242,8 @@ but may be implemented straightforwardly as follows:
>  	\hline
>  	\hline
>  	Thread Management
> -		& \co{pthread_t}
> -			& \co{struct task_struct} \\
> +		& pthread\_t
> +			& struct task\_struct \\
>  	\cline{2-3}
>  		& \co{pthread_create()}
>  			& \co{kthread_create} \\
> --
> 
> so it can't stand the {}'s and the _'s all of a sudden.
> 
> Or my table format definition is screwed or so after the last update...

Or the newer version of latex doesn't like the \co{} macro definition.

One hack-around is to replace the definition on line 38 of perfbook.tex
with something like this:

	\newcommand{\co}[1]{\url{#1}}

Does that help, modulo the resulting bogus links?

							Thanx, Paul

