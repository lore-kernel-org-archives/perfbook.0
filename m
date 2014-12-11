Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e38.co.us.ibm.com ([32.97.110.159]:59238 "EHLO
 e38.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S933301AbaLKVOf (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 11 Dec 2014
 16:14:35 -0500
Received: from /spool/local	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 11 Dec
 2014 14:14:35 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])	by d03dlp03.boulder.ibm.com
 (Postfix) with ESMTP id 0A39E19D8047	for <perfbook@vger.kernel.org>; Thu, 11
 Dec 2014 14:03:12 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com
 [9.17.195.167])	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id sBBLEWlQ51839012	for <perfbook@vger.kernel.org>; Thu, 11 Dec
 2014 14:14:32 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 sBBLEW2L024966	for <perfbook@vger.kernel.org>; Thu, 11 Dec 2014 14:14:32
 -0700
Date: Thu, 11 Dec 2014 13:14:29 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: perfbook build error
Message-ID: <20141211211429.GA23711@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20141211173210.GE31140@pd.tnic>
 <20141211175248.GK25340@linux.vnet.ibm.com> <20141211190724.GF31140@pd.tnic>
 <20141211191734.GG31140@pd.tnic> <20141211193230.GM25340@linux.vnet.ibm.com>
 <20141211195922.GH31140@pd.tnic> <20141211201014.GN25340@linux.vnet.ibm.com>
 <20141211202238.GI31140@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141211202238.GI31140@pd.tnic>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: perfbook@vger.kernel.org

On Thu, Dec 11, 2014 at 09:22:38PM +0100, Borislav Petkov wrote:
> On Thu, Dec 11, 2014 at 12:10:14PM -0800, Paul E. McKenney wrote:
> > > ! Illegal parameter number in definition of \Hy@tempa.
> > > <to be read again> 
> > >                    d
> > > l.876 two \co{#define}
> > >                        statements, giving us not one but two ways to create
> > > ? 
> > > ! Emergency stop.
> > > <to be read again> 
> > >                    d
> > > l.876 two \co{#define}
> > >                        statements, giving us not one but two ways to create
> > > End of file on the terminal!
> > > ---
> > 
> > That is odd given that URLs really can contain "#"...
> 
> I'm reading the error message like it has a problem with the "#" in
> "#define" but I might be wrong.

Yep, that is my feeling as well.  And so \url{#define} would mean
the name "define" in the current document.  Which admittedly would be
more meaningful in an html document.

							Thanx, Paul

