Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e37.co.us.ibm.com ([32.97.110.158]:57151 "EHLO
 e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752783AbaLKTvI (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 11 Dec 2014
 14:51:08 -0500
Received: from /spool/local	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 11 Dec
 2014 12:51:07 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 2AB893E4003F	for <perfbook@vger.kernel.org>; Thu, 11
 Dec 2014 12:51:06 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com
 [9.17.195.167])	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id sBBJpSe131916140	for <perfbook@vger.kernel.org>; Thu, 11 Dec
 2014 12:51:28 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 sBBJp5A4025004	for <perfbook@vger.kernel.org>; Thu, 11 Dec 2014 12:51:05
 -0700
Date: Thu, 11 Dec 2014 11:51:03 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: perfbook build error
Message-ID: <20141211195103.GA7857@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20141211173210.GE31140@pd.tnic>
 <20141211175248.GK25340@linux.vnet.ibm.com> <20141211190724.GF31140@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141211190724.GF31140@pd.tnic>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: perfbook@vger.kernel.org

On Thu, Dec 11, 2014 at 08:07:24PM +0100, Borislav Petkov wrote:
> On Thu, Dec 11, 2014 at 09:52:48AM -0800, Paul E. McKenney wrote:
> > Hmmm...  Works for me.  (Famous last words...)
> > 
> > I am at commit #763eb4b811f9 (Fix resizable-hash figures).
> 
> Ditto.
> 
> > I also sometimes see odd errors like this due to an interrupted run that
> > leaves bogus .aux files around.  A "make clean" will clear this up.
> 
> Nope, that doesn't help.
> 
> Strangely, I'm getting a bunch of undefined references before it fails:
> 
> ----- Fatal latex error, see perfbook.log for details. -----
> LaTeX Warning: Reference `chp:How To Use This Book' on page 1 undefined on inpu
> LaTeX Warning: Reference `chp:Introduction' on page 1 undefined on input line 4
> LaTeX Warning: Reference `chp:Hardware and its Habits' on page 1 undefined on i
> LaTeX Warning: Reference `chp:Tools of the Trade' on page 1 undefined on input 
> LaTeX Warning: Reference `chp:Counting' on page 1 undefined on input line 57.
> LaTeX Warning: Reference `cha:Partitioning and Synchronization Design' on page
> ...

And these are because latex accumulates the definitions on one pass, and
then uses these definitions on the next pass.  So if your first pass never
does complete correctly, the next pass won't have some or all of the
definitions.

							Thanx, Paul

> > I am also using an oldish version of latex.  Let me see what happens
> > with a more recent version...  Well, on that system, it complains about
> > pstricks.sty not being present.  :-/
> > 
> > In the meantime, here is the version of latex I am using:
> > 
> > 	k$ latex --v
> > 	pdfTeX 3.1415926-1.40.10-2.2 (TeX Live 2009/Debian)
> > 	kpathsea version 5.0.0
> > 	Copyright 2009 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
> > 	There is NO warranty.  Redistribution of this software is
> > 	covered by the terms of both the pdfTeX copyright and
> > 	the Lesser GNU General Public License.
> > 	For more information about these matters, see the file
> > 	named COPYING and the pdfTeX source.
> > 	Primary author of pdfTeX: Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
> > 	Compiled with libpng 1.2.46; using libpng 1.2.46
> > 	Compiled with zlib 1.2.3.4; using zlib 1.2.3.4
> > 	Compiled with poppler version 0.18.2
> 
> $ latex --v
> pdfTeX 3.14159265-2.6-1.40.15 (TeX Live 2015/dev/Debian)
> kpathsea version 6.2.1dev
> Copyright 2014 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
> There is NO warranty.  Redistribution of this software is
> covered by the terms of both the pdfTeX copyright and
> the Lesser GNU General Public License.
> For more information about these matters, see the file
> named COPYING and the pdfTeX source.
> Primary author of pdfTeX: Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
> Compiled with libpng 1.6.13; using libpng 1.6.13
> Compiled with zlib 1.2.8; using zlib 1.2.8
> Compiled with poppler version 0.26.5
> 
> Btw, I commented out the table in toolsoftrade/toolsoftrade.tex and the
> conversion exploded on the next table in defer/rcufundamental.tex. So it
> must be have something to do with the tables...
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> Sent from a fat crate under my desk. Formatting is fine.
> --
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

