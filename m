Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:58207 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S965649AbaLLTbB (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 12 Dec 2014
 14:31:01 -0500
Received: from /spool/local	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 12 Dec
 2014 12:31:00 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 641FD3E40041	for <perfbook@vger.kernel.org>; Fri, 12
 Dec 2014 12:30:57 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com
 [9.17.195.167])	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id sBCJTu6u25952466	for <perfbook@vger.kernel.org>; Fri, 12 Dec
 2014 12:29:56 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 sBCJUvfd031218	for <perfbook@vger.kernel.org>; Fri, 12 Dec 2014 12:30:57
 -0700
Date: Fri, 12 Dec 2014 11:30:55 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: perfbook build error
Message-ID: <20141212193055.GC25340@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20141211195922.GH31140@pd.tnic>
 <20141211201014.GN25340@linux.vnet.ibm.com> <20141211202238.GI31140@pd.tnic>
 <20141211211429.GA23711@linux.vnet.ibm.com>
 <20141212163835.GA29275@linux.vnet.ibm.com> <20141212175313.GD30699@pd.tnic>
 <20141212181804.GX25340@linux.vnet.ibm.com> <20141212184737.GE30699@pd.tnic>
 <20141212185857.GZ25340@linux.vnet.ibm.com> <20141212191337.GF30699@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141212191337.GF30699@pd.tnic>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: perfbook@vger.kernel.org

On Fri, Dec 12, 2014 at 08:13:37PM +0100, Borislav Petkov wrote:
> On Fri, Dec 12, 2014 at 10:58:57AM -0800, Paul E. McKenney wrote:
> > You put this above definition in perfbook.tex?
> 
> Nope, this goes into
> 
> /usr/share/texlive/texmf-dist/tex/latex/listings/listings.sty
> 
> which is part of texlive-latex-recommended. It needs to be fixed in the
> distro.

Thank you for the info!  It is likely to be helpful to others as well.  ;-)

							Thanx, Paul

