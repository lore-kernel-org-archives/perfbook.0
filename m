Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726843AbfKKOS7 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 11 Nov 2019 09:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573481938;
        bh=HcnoTsbblYd9j0wDMln0lYxzs3KHERX8+cdz1mOfP9s=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Fv0T56F1/CJ0ti/y3zpzkLp8/6lt9HkeL1e5rBvPlJkCu7hYmzYbOhEiWG5TQwn92
         LYp3WuC/O2y0Dsv1vO2XdSOSzybqMvSPI9hwy4Hq2XnGrCJvCS0lG9YqlfHbXtBwhg
         P7TeI90xd+UfaIY6sCE21ALCb1DaWnMtcqiIcKrs=
Date: Mon, 11 Nov 2019 06:18:57 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] A little typos of perfbook
Message-ID: <20191111141857.GM2865@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <5dc51e76.1c69fb81.b298d.6c9aSMTPIN_ADDED_BROKEN@mx.google.com>
 <20191111035934.GI2865@paulmck-ThinkPad-P72>
 <5dc940b4.1c69fb81.e45a9.e689SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dc940b4.1c69fb81.e45a9.e689SMTPIN_ADDED_BROKEN@mx.google.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: laokz <laokz@foxmail.com>
Cc: perfbook mailing list <perfbook@vger.kernel.org>

On Mon, Nov 11, 2019 at 07:04:57PM +0800, laokz wrote:
> Hello Paul,
> 
> On Sun, Nov 10, 2019 at 19:59 -0800，Paul E. McKenney wrote：
> > The patch did get corrupted by line breaks being inserted.  I fixed
> > most of them, but it would be good to adjust your email agent to
> > prevent this in the future.
> 
> Oh sorry, newbie always face with so many new issues;) 

We all were newbies, so some time to get everything adjusted is to
be expected.

> > > diff --git a/defer/RCUListInsertClassic.svg b/defer/RCUListInsertClassic.svg
> > > index f18a20e9..f93f4189 100644
> > > --- a/defer/RCUListInsertClassic.svg
> > > +++ b/defer/RCUListInsertClassic.svg
> > > @@ -324,7 +324,7 @@
> > >         id="text64"
> > >         style="font-size:108px;font-style:normal;font-weight:bold;text-
> > > anchor:middle;fill:#000000;font-family:Courier"><tspan
> > >           style="font-size:108.53968048px;font-style:normal;font-
> > > variant:normal;font-weight:bold;font-stretch:normal;font-family:Liberation
> > > Mono;-inkscape-font-specification:Liberation Mono Bold"
> > > -         id="tspan3836">gptr = smp_load_acquire(&amp;p);</tspan></text>
> > > +         id="tspan3836">smp_store_release(&amp;gptr, p);</tspan></text>
> > >      <!-- Text -->
> > >      <!-- Text -->
> > >      <!-- Text -->
> > > 
> > Good catch on all three of these, thank you!  (I had to do the patch to
> > the figure by hand, though -- looks like some bad line breaks got inserted
> > at some point.)
> 
> The newest perfbook tree shows that maybe my awkward patch tired you: smp_store_release(&amp;p, gptr) should be smp_store_release(&amp;gptr, p).

I clearly was not being careful enough, was I?  I was unable to fix
this part of your path, so attempted to apply it by hand.  :-/

I folded the update back into your commit.

> > > diff --git a/memorder/RCU2G2R.svg b/memorder/RCU2G2R.svg
> > > index 124649e9..ac339491 100644
> > > --- a/memorder/RCU2G2R.svg
> > > +++ b/memorder/RCU2G2R.svg
> > > @@ -823,7 +823,7 @@
> > >             x="39.021881"
> > >             y="793.81842"
> > >             id="tspan4936-7"
> > > -           style="text-align:start;text-anchor:start">WRITE_ONCE(x0,
> > > 2);</tspan></text>
> > > +           style="text-align:start;text-anchor:start">WRITE_ONCE(x1,
> > > 2);</tspan></text>
> > >      </g>
> > >      <g
> > >         transform="matrix(1.0007732,0,0,1.1198315,132.03049,64.767338)"
> > > @@ -876,7 +876,7 @@
> > >             id="tspan5356-1"
> > >             y="792.81842"
> > >             x="35.972801"
> > > -           sodipodi:role="line">r2 = READ_ONCE(x1);</tspan></text>
> > > +           sodipodi:role="line">r2 = READ_ONCE(x2);</tspan></text>
> > >      </g>
> > >      <text
> > >         xml:space="preserve"
> > 
> > In this figure, each process writes one variable and reads the next.
> > So P0() writes x0, then reads x1, P1() writes x1 and reads x2, and
> > P2() writes x2 and reads x0.  This matches List 15.40.
> 
> This matches List 15.41 and Figure 15.14 - Two RCU Grace Periods and Two Readers. Original figure's P1() had wrong variables. By the way, P0's arrow to P1 was obscure, but I don't know how to fix.

You are quite right, please accept my apologies for my confusion.

Let's see...  Opening the .svg file in inkscape and comparing to the
code...  And updating.  Unfortunately, I recently upgraded to a new
version of inkscape, so the diff is unenlightening.  But I pushed the
result out, so please pull it and check to see if I messed something up.

> > > diff --git a/memorder/store15tred.dot b/memorder/store15tred.dot
> > > index ba6a277e..03a2f22c 100644
> > > --- a/memorder/store15tred.dot
> > > +++ b/memorder/store15tred.dot
> > > @@ -1,5 +1,6 @@
> > >  digraph sequence15CPUs {
> > >  	1 -> 6;
> > > +	2 -> 3;
> > >  	2 -> 15;
> > >  	3 -> 9;
> > >  	4 -> 10;
> > 
> > There is a problem here, but the fix is to change "2 -> 15" to
> > "2 -> 3", correct?
> 
> According to Figure 15.5, CPU2 had transient values 2 -> 3 -> 9, CPU6, 7 perceived 6(7) -> 2 -> 15 -> 9. Its relevant Figure 15.6 lost two arches.
> 
> I recommit the last three patches, wish them not too boring:) The attachment is the same patch file.

Definitely not boring!  I very much appreciate your good eyes and your
attention to detail.

> 
> Best regards,
> laokz
> 
> Signed-off-by: Zhang, Kai <laokz@foxmail.com>
> 
> -----------
> 
> diff --git a/defer/RCUListInsertClassic.svg b/defer/RCUListInsertClassic.svg
> index 13f3c46d..cb0e060a 100644
> --- a/defer/RCUListInsertClassic.svg
> +++ b/defer/RCUListInsertClassic.svg
> @@ -326,7 +326,7 @@
>         id="text64"
>         style="font-style:normal;font-weight:bold;font-size:108px;line-
> height:0%;font-family:Courier;text-anchor:middle;fill:#000000"><tspan
>           style="font-style:normal;font-variant:normal;font-
> weight:bold;font-stretch:normal;font-size:108.53968048px;font-
> family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono
> Bold'"
> -         id="tspan3836">smp_store_release(&amp;p, gptr);</tspan></text>
> +         id="tspan3836">smp_store_release(&amp;gptr, p);</tspan></text>
>      <!-- Text -->
>      <!-- Text -->
>      <!-- Text -->
> diff --git a/memorder/RCU2G2R.svg b/memorder/RCU2G2R.svg
> index 124649e9..ac339491 100644
> --- a/memorder/RCU2G2R.svg
> +++ b/memorder/RCU2G2R.svg
> @@ -823,7 +823,7 @@
>             x="39.021881"
>             y="793.81842"
>             id="tspan4936-7"
> -           style="text-align:start;text-anchor:start">WRITE_ONCE(x0,
> 2);</tspan></text>
> +           style="text-align:start;text-anchor:start">WRITE_ONCE(x1,
> 2);</tspan></text>
>      </g>
>      <g
>         transform="matrix(1.0007732,0,0,1.1198315,132.03049,64.767338)"
> @@ -876,7 +876,7 @@
>             id="tspan5356-1"
>             y="792.81842"
>             x="35.972801"
> -           sodipodi:role="line">r2 = READ_ONCE(x1);</tspan></text>
> +           sodipodi:role="line">r2 = READ_ONCE(x2);</tspan></text>
>      </g>
>      <text
>         xml:space="preserve"

I believe that I have these taken car of.

> diff --git a/memorder/store15tred.dot b/memorder/store15tred.dot
> index ba6a277e..1fc6f35b 100644
> --- a/memorder/store15tred.dot
> +++ b/memorder/store15tred.dot
> @@ -1,5 +1,6 @@
>  digraph sequence15CPUs {
>  	1 -> 6;
> +	2 -> 3;

True, there is a 2->3 arc, but that arc is redundant with the
2->15->3 arc.

>  	2 -> 15;
>  	3 -> 9;
>  	4 -> 10;
> @@ -14,5 +15,6 @@ digraph sequence15CPUs {
>  	13 -> 12;
>  	14 -> 15;
>  	15 -> 12;
> +	15 -> 9;

And similarly, yes, there is are a number of 15->9 arcs, but they
are redundant with 15->12->9.

It has been quite a few years, but if I remember correctly, I used
the UNIX tsort function to arrive at a minimal topology.  But please
do check.  Murphy's Law and all that!  ;-)

							Thanx, Paul

>  	15 -> 3;
>  }
> 
> 
> 
