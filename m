Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e33.co.us.ibm.com ([32.97.110.151]:46433 "EHLO
 e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S932909AbaLKRww (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 11 Dec 2014
 12:52:52 -0500
Received: from /spool/local	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 11 Dec
 2014 10:52:52 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])	by d03dlp03.boulder.ibm.com
 (Postfix) with ESMTP id E401719D8039	for <perfbook@vger.kernel.org>; Thu, 11
 Dec 2014 10:41:29 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com
 [9.17.195.167])	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id sBBHpohO31588602	for <perfbook@vger.kernel.org>; Thu, 11 Dec
 2014 10:51:50 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 sBBHqoPi024163	for <perfbook@vger.kernel.org>; Thu, 11 Dec 2014 10:52:50
 -0700
Date: Thu, 11 Dec 2014 09:52:48 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: perfbook build error
Message-ID: <20141211175248.GK25340@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20141211173210.GE31140@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141211173210.GE31140@pd.tnic>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: perfbook@vger.kernel.org

On Thu, Dec 11, 2014 at 06:32:10PM +0100, Borislav Petkov wrote:
> Hey Paul,
> 
> building perfbook from today here fails with:
> 
> Underfull \hbox (badness 7576) in paragraph at lines 1234--1234
> []\T1/ptm/b/n/14.4 Linux-Kernel Equiv-a-lents to
>  []
> 
> ! Missing { inserted.
> <inserted text> 
>                 {
> l.1246                  &
>             \co{struct task_struct} \\
> ? 
> ! Emergency stop.
> <inserted text> 
>                 {
> l.1246                  &
>             \co{struct task_struct} \\
> End of file on the terminal!
> 
> 
> Here is how much of TeX's memory you used:
>  9728 strings out of 495020
>  150662 string characters out of 6181323
>  256123 words of memory out of 5000000
>  12316 multiletter control sequences out of 15000+600000
>  92251 words of font info for 258 fonts, out of 8000000 for 9000
>  14 hyphenation exceptions out of 8191
>  33i,15n,35p,324b,1121s stack positions out of 5000i,500n,10000p,200000b,80000s
> !  ==> Fatal error occurred, no output PDF file produced!
> ---
> 
> That's somewhere around that table in toolsoftrade/toolsoftrade.tex,
> lines 1240ff.
> 
> Maybe my latex setup is missing something...

Hmmm...  Works for me.  (Famous last words...)

I am at commit #763eb4b811f9 (Fix resizable-hash figures).

I also sometimes see odd errors like this due to an interrupted run that
leaves bogus .aux files around.  A "make clean" will clear this up.

I am also using an oldish version of latex.  Let me see what happens
with a more recent version...  Well, on that system, it complains about
pstricks.sty not being present.  :-/

In the meantime, here is the version of latex I am using:

	k$ latex --v
	pdfTeX 3.1415926-1.40.10-2.2 (TeX Live 2009/Debian)
	kpathsea version 5.0.0
	Copyright 2009 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
	There is NO warranty.  Redistribution of this software is
	covered by the terms of both the pdfTeX copyright and
	the Lesser GNU General Public License.
	For more information about these matters, see the file
	named COPYING and the pdfTeX source.
	Primary author of pdfTeX: Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
	Compiled with libpng 1.2.46; using libpng 1.2.46
	Compiled with zlib 1.2.3.4; using zlib 1.2.3.4
	Compiled with poppler version 0.18.2

CCing the mailing list in case someone knows how to solve this one.

							Thanx, Paul

