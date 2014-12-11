Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail.skyhub.de ([78.46.96.112]:35893 "EHLO mail.skyhub.de"
 rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP	id S1755889AbaLKTH2
 (ORCPT <rfc822;perfbook@vger.kernel.org>);	Thu, 11 Dec 2014 14:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418324847; bh=vH/hogoHHpMdIM1gdMNPpybc+afSJ35y+Ftij733wE4=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=RRF2iLPo9Vdn1hsU2bgTiriL7cd/qsIQtcdOVW
 gMMdTDpokhazLy2pzblSz8ZEGk6gygGvfjzq/4Zs9312GMzKyzvQzYaNfjoDynD/QV7
 NpwKmTK069y3QcOm7ashSA+WhrF98Pkp/WFa0ayZy3xHt8u/+B0SKEgdSDXRj/nh84=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
 t=1418324846; bh=vH/hogoHHpMdIM1gdMNPpybc+afSJ35y+Ftij733wE4=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To; b=GYRoCXjV8M0YkfgZNG+1WwNSfLuDP2CkKJugHv
 g/mJdf3z+0jYNUh/L6Kxq1ScrKnxMMO7i3RYPJme3EJwwIl26bU663aIeERdL1Fvp3v
 Xcy9UzeirUmujdlRq/aE27y78wbLunKIepX3CN5S6ME7y2QKE+7g810vdlM6gyq9Fc=
Date: Thu, 11 Dec 2014 20:07:24 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: perfbook build error
Message-ID: <20141211190724.GF31140@pd.tnic>
References: <20141211173210.GE31140@pd.tnic>
 <20141211175248.GK25340@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20141211175248.GK25340@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org

On Thu, Dec 11, 2014 at 09:52:48AM -0800, Paul E. McKenney wrote:
> Hmmm...  Works for me.  (Famous last words...)
> 
> I am at commit #763eb4b811f9 (Fix resizable-hash figures).

Ditto.

> I also sometimes see odd errors like this due to an interrupted run that
> leaves bogus .aux files around.  A "make clean" will clear this up.

Nope, that doesn't help.

Strangely, I'm getting a bunch of undefined references before it fails:

----- Fatal latex error, see perfbook.log for details. -----
LaTeX Warning: Reference `chp:How To Use This Book' on page 1 undefined on inpu
LaTeX Warning: Reference `chp:Introduction' on page 1 undefined on input line 4
LaTeX Warning: Reference `chp:Hardware and its Habits' on page 1 undefined on i
LaTeX Warning: Reference `chp:Tools of the Trade' on page 1 undefined on input 
LaTeX Warning: Reference `chp:Counting' on page 1 undefined on input line 57.
LaTeX Warning: Reference `cha:Partitioning and Synchronization Design' on page
...

> I am also using an oldish version of latex.  Let me see what happens
> with a more recent version...  Well, on that system, it complains about
> pstricks.sty not being present.  :-/
> 
> In the meantime, here is the version of latex I am using:
> 
> 	k$ latex --v
> 	pdfTeX 3.1415926-1.40.10-2.2 (TeX Live 2009/Debian)
> 	kpathsea version 5.0.0
> 	Copyright 2009 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
> 	There is NO warranty.  Redistribution of this software is
> 	covered by the terms of both the pdfTeX copyright and
> 	the Lesser GNU General Public License.
> 	For more information about these matters, see the file
> 	named COPYING and the pdfTeX source.
> 	Primary author of pdfTeX: Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
> 	Compiled with libpng 1.2.46; using libpng 1.2.46
> 	Compiled with zlib 1.2.3.4; using zlib 1.2.3.4
> 	Compiled with poppler version 0.18.2

$ latex --v
pdfTeX 3.14159265-2.6-1.40.15 (TeX Live 2015/dev/Debian)
kpathsea version 6.2.1dev
Copyright 2014 Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
There is NO warranty.  Redistribution of this software is
covered by the terms of both the pdfTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the pdfTeX source.
Primary author of pdfTeX: Peter Breitenlohner (eTeX)/Han The Thanh (pdfTeX).
Compiled with libpng 1.6.13; using libpng 1.6.13
Compiled with zlib 1.2.8; using zlib 1.2.8
Compiled with poppler version 0.26.5

Btw, I commented out the table in toolsoftrade/toolsoftrade.tex and the
conversion exploded on the next table in defer/rcufundamental.tex. So it
must be have something to do with the tables...

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
