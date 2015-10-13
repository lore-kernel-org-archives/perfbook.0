Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e38.co.us.ibm.com ([32.97.110.159]:42966 "EHLO
 e38.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1753014AbbJMOza (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 13 Oct 2015
 10:55:30 -0400
Received: from localhost	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 13 Oct
 2015 08:55:30 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 718033E4003B	for <perfbook@vger.kernel.org>; Tue, 13
 Oct 2015 08:55:27 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t9DEqDOa64749780	for <perfbook@vger.kernel.org>; Tue, 13 Oct 2015 07:52:13
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t9DEtQ1g000836	for <perfbook@vger.kernel.org>; Tue, 13 Oct 2015 08:55:27
 -0600
Date: Tue, 13 Oct 2015 06:31:25 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Trouble building perfbook
Message-ID: <20151013133125.GM3910@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <561C9C0E.4090703@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <561C9C0E.4090703@au1.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 13, 2015 at 04:52:14PM +1100, Andrew Donnellan wrote:
> Hi perfbook list,
> 
> I'm having trouble building perfbook (latest git) - am encountering
> a weird fatal TeX error. I'm using the current TeXLive 2015 from
> Debian stable.
> 
> The TeX logfile is available at [0].
> 
> I've taken a look at the section of perfbook_flat.tex that it refers
> to, and I can't see anything particularly out of the ordinary. My
> LaTeX-fu isn't quite good enough to figure out what's going on here
> - any assistance would be appreciated!
> 
> 
> Andrew
> 
> 
> [0] http://pastebin.com/r4rMzF4d

This looks like the same LaTeX bug that Borislav Petkov ran into
some time back.  He came up with the workaround below, does this
work for you?

Just out of curiosity, what distro are you using?  I haven't run into
this myself on either Ubuntu 12.04 or 14.04.

							Thanx, Paul

------------------------------------------------------------------------

Apparently, it is still an open bug which seems unresolved even in tex
upstream, AFAICT:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=752773

I tried the suggested workaround first by replacing \lstinline in

/usr/share/texlive/texmf-dist/tex/latex/listings/listings.sty

with it but it complained about an undefined command. Then I went and
did this:

\newcommand\lstinline[1][]{%
   \leavevmode\bgroup % \hbox\bgroup --> \bgroup
     \def\lst@boxpos{b}%
     \lsthk@PreSet\lstset{flexiblecolumns,#1}%
     \lsthk@TextStyle
     \ifnum\iffalse{\fi`}=\z@\fi
     \@ifnextchar\bgroup{%
        \ifnum`{=\z@}\fi%
        \afterassignment\lst@InlineG \let\@let@token}{%
        \ifnum`{=\z@}\fi\lstinline@}}

and the pdf was built successfully.

This this goes into

/usr/share/texlive/texmf-dist/tex/latex/listings/listings.sty

which is part of texlive-latex-recommended. It needs to be fixed in the
distro.

