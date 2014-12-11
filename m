Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e31.co.us.ibm.com ([32.97.110.149]:54646 "EHLO
 e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1758330AbaLKUKT (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 11 Dec 2014
 15:10:19 -0500
Received: from /spool/local	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 11 Dec
 2014 13:10:18 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 776B93E4003F	for <perfbook@vger.kernel.org>; Thu, 11
 Dec 2014 13:10:16 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com
 [9.17.195.167])	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id sBBKAuUv48365714	for <perfbook@vger.kernel.org>; Thu, 11 Dec
 2014 13:10:56 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 sBBKAGwx022281	for <perfbook@vger.kernel.org>; Thu, 11 Dec 2014 13:10:16
 -0700
Date: Thu, 11 Dec 2014 12:10:14 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: perfbook build error
Message-ID: <20141211201014.GN25340@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20141211173210.GE31140@pd.tnic>
 <20141211175248.GK25340@linux.vnet.ibm.com> <20141211190724.GF31140@pd.tnic>
 <20141211191734.GG31140@pd.tnic> <20141211193230.GM25340@linux.vnet.ibm.com>
 <20141211195922.GH31140@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141211195922.GH31140@pd.tnic>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: perfbook@vger.kernel.org

On Thu, Dec 11, 2014 at 08:59:22PM +0100, Borislav Petkov wrote:
> On Thu, Dec 11, 2014 at 11:32:30AM -0800, Paul E. McKenney wrote:
> > Or the newer version of latex doesn't like the \co{} macro definition.
> > 
> > One hack-around is to replace the definition on line 38 of perfbook.tex
> > with something like this:
> > 
> > 	\newcommand{\co}[1]{\url{#1}}
> > 
> > Does that help, modulo the resulting bogus links?
> 
> Nah, this chokes on the '#' char:
> 
> ! Illegal parameter number in definition of \Hy@tempa.
> <to be read again> 
>                    d
> l.876 two \co{#define}
>                        statements, giving us not one but two ways to create
> ? 
> ! Emergency stop.
> <to be read again> 
>                    d
> l.876 two \co{#define}
>                        statements, giving us not one but two ways to create
> End of file on the terminal!
> ---

That is odd given that URLs really can contain "#"...

> Btw, don't waste too much time with it before you can reproduce it
> yourself and can actually confirm it is a latex issue. I might be
> missing packages or so... although updating texlive-latex-* works out
> fine and pulls in whatever it needs.
> 
> Btw, it looks like it has trouble with this custom defined command. Built-in
> stuff works:
> 
> ---
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index c98f3a78652f..e227fe7363fb 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1242,7 +1242,7 @@ but may be implemented straightforwardly as follows:
>         \hline
>         \hline
>         Thread Management
> -               & \co{pthread_t}
> +               & \L test

I am guessing that \L chokes on underscores, otherwise, it would be an
attractive alternative to \co{}.  (It does choke on underscores in my
old environment.)

>                         & \co{struct task_struct} \\
>         \cline{2-3}
>                 & \co{pthread_create()}
> --
> 
> I need to investigate more.

Please let me know how it goes!

							Thanx, Paul

