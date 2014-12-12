Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e35.co.us.ibm.com ([32.97.110.153]:42433 "EHLO
 e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S932399AbaLLS7B (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 12 Dec 2014
 13:59:01 -0500
Received: from /spool/local	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 12 Dec
 2014 11:59:01 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id CF7DE1FF001F	for <perfbook@vger.kernel.org>; Fri, 12
 Dec 2014 11:47:43 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com
 [9.17.195.167])	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id sBCIvxnC18415850	for <perfbook@vger.kernel.org>; Fri, 12 Dec
 2014 11:57:59 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 sBCIwxD9015420	for <perfbook@vger.kernel.org>; Fri, 12 Dec 2014 11:58:59
 -0700
Date: Fri, 12 Dec 2014 10:58:57 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: perfbook build error
Message-ID: <20141212185857.GZ25340@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20141211191734.GG31140@pd.tnic>
 <20141211193230.GM25340@linux.vnet.ibm.com> <20141211195922.GH31140@pd.tnic>
 <20141211201014.GN25340@linux.vnet.ibm.com> <20141211202238.GI31140@pd.tnic>
 <20141211211429.GA23711@linux.vnet.ibm.com>
 <20141212163835.GA29275@linux.vnet.ibm.com> <20141212175313.GD30699@pd.tnic>
 <20141212181804.GX25340@linux.vnet.ibm.com> <20141212184737.GE30699@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141212184737.GE30699@pd.tnic>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: perfbook@vger.kernel.org

On Fri, Dec 12, 2014 at 07:47:37PM +0100, Borislav Petkov wrote:
> On Fri, Dec 12, 2014 at 10:18:05AM -0800, Paul E. McKenney wrote:
> > And I take it that just adding braces doesn't work either, the discussion in
> > http://tex.stackexchange.com/questions/102119/why-doesnt-lstinline-work-in-table-column
> > notwithstanding?
> > 
> > 	{\co{struct task_struct}}
> > 
> > Or:
> > 
> > 	{ \co{struct task_struct} }
> 
> No, neither.
> 
> /me searches a bit more, gets lucky...
> 
> Apparently, it is still an open bug which seems unresolved even in tex
> upstream, AFAICT:
> 
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=752773
> 
> I tried the suggested workaround first by replacing \lstinline in
> 
> /usr/share/texlive/texmf-dist/tex/latex/listings/listings.sty
> 
> with it but it complained about an undefined command. Then I went and
> did this:
> 
> \newcommand\lstinline[1][]{%
>    \leavevmode\bgroup % \hbox\bgroup --> \bgroup
>      \def\lst@boxpos{b}%
>      \lsthk@PreSet\lstset{flexiblecolumns,#1}%
>      \lsthk@TextStyle
>      \ifnum\iffalse{\fi`}=\z@\fi
>      \@ifnextchar\bgroup{%
>         \ifnum`{=\z@}\fi%
>         \afterassignment\lst@InlineG \let\@let@token}{%
>         \ifnum`{=\z@}\fi\lstinline@}}
> 
> and the pdf was built successfully.
> 
> Maybe I should let the guys know that it still triggers...

Nice!!!

You put this above definition in perfbook.tex?

							Thanx, Paul

