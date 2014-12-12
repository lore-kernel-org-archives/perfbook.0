Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e33.co.us.ibm.com ([32.97.110.151]:34777 "EHLO
 e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S933666AbaLLQil (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 12 Dec 2014
 11:38:41 -0500
Received: from /spool/local	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 12 Dec
 2014 09:38:41 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])	by d03dlp03.boulder.ibm.com
 (Postfix) with ESMTP id 422B919D8048	for <perfbook@vger.kernel.org>; Fri, 12
 Dec 2014 09:27:17 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com
 [9.17.195.167])	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id sBCGd1Dl40042744	for <perfbook@vger.kernel.org>; Fri, 12 Dec
 2014 09:39:01 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 sBCGcb8X009988	for <perfbook@vger.kernel.org>; Fri, 12 Dec 2014 09:38:37
 -0700
Date: Fri, 12 Dec 2014 08:38:35 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: perfbook build error
Message-ID: <20141212163835.GA29275@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20141211173210.GE31140@pd.tnic>
 <20141211175248.GK25340@linux.vnet.ibm.com> <20141211190724.GF31140@pd.tnic>
 <20141211191734.GG31140@pd.tnic> <20141211193230.GM25340@linux.vnet.ibm.com>
 <20141211195922.GH31140@pd.tnic> <20141211201014.GN25340@linux.vnet.ibm.com>
 <20141211202238.GI31140@pd.tnic> <20141211211429.GA23711@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141211211429.GA23711@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: perfbook@vger.kernel.org

On Thu, Dec 11, 2014 at 01:14:29PM -0800, Paul E. McKenney wrote:
> On Thu, Dec 11, 2014 at 09:22:38PM +0100, Borislav Petkov wrote:
> > On Thu, Dec 11, 2014 at 12:10:14PM -0800, Paul E. McKenney wrote:
> > > > ! Illegal parameter number in definition of \Hy@tempa.
> > > > <to be read again> 
> > > >                    d
> > > > l.876 two \co{#define}
> > > >                        statements, giving us not one but two ways to create
> > > > ? 
> > > > ! Emergency stop.
> > > > <to be read again> 
> > > >                    d
> > > > l.876 two \co{#define}
> > > >                        statements, giving us not one but two ways to create
> > > > End of file on the terminal!
> > > > ---
> > > 
> > > That is odd given that URLs really can contain "#"...
> > 
> > I'm reading the error message like it has a problem with the "#" in
> > "#define" but I might be wrong.
> 
> Yep, that is my feeling as well.  And so \url{#define} would mean
> the name "define" in the current document.  Which admittedly would be
> more meaningful in an html document.

Does wrapping the \co{} in mbox help?  Please see the patch below for
an example.

Your environment apparently does handle \co{} in other environments,
as there are a lot of them in Chapter 1.  So if mbox fixes it for you,
I would be OK mboxing all the \co{}s in tables.

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index c98f3a78652f..a5b530fc989e 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1242,7 +1242,7 @@ but may be implemented straightforwardly as follows:
 	\hline
 	\hline
 	Thread Management
-		& \co{pthread_t}
+		& \mbox{\co{pthread_t}}
 			& \co{struct task_struct} \\
 	\cline{2-3}
 		& \co{pthread_create()}

