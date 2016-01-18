Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e37.co.us.ibm.com ([32.97.110.158]:53401 "EHLO
 e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751964AbcAREJL (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 17 Jan 2016
 23:09:11 -0500
Received: from localhost	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 17 Jan
 2016 21:09:11 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 367363E40030	for <perfbook@vger.kernel.org>; Sun, 17
 Jan 2016 21:09:09 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0I499g229819058	for <perfbook@vger.kernel.org>; Sun, 17 Jan 2016 21:09:09
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0I498Pb003676	for <perfbook@vger.kernel.org>; Sun, 17 Jan 2016 21:09:08
 -0700
Date: Sun, 17 Jan 2016 20:09:10 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: I am translating the book in Korean
Message-ID: <20160118040910.GY3818@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAEjAshoeN2zOd=OEH_DBwdXG7uBDQkfWaeQr+8mTyoObF_onqg@mail.gmail.com>
 <CAEjAshqMr-jMKx92UTAt2JdZd_F0Swmrwedquy4f+hRKX95hww@mail.gmail.com>
 <20160118031056.GX3818@linux.vnet.ibm.com>
 <CAEjAshq0QM5YLKB+iQYAZUVPVKNixCVgx129Ke8ozmY2BgWK1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAEjAshq0QM5YLKB+iQYAZUVPVKNixCVgx129Ke8ozmY2BgWK1w@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 18, 2016 at 12:15:24PM +0900, SeongJae Park wrote:
> On Mon, Jan 18, 2016 at 12:10 PM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Mon, Jan 18, 2016 at 10:21:27AM +0900, SeongJae Park wrote:
> >> Hi Paul,
> >>
> >> I am waiting for your reply yet. Is there anything wrong?
> >
> > Only that I seem to have not gotten your email.
> >
> > I see your git archive, which does look to have the howto chapter
> > translated.
> >
> > So how about the following patch to FAQ.txt?
> 
> Looks great. I believe the change will motivate me for faster progress ;)

Very good, applied and pushed!

							Thanx, Paul

> Thanks,
> SeongJae Park
> 
> >
> >                                                         Thanx, Paul
> >
> > ------------------------------------------------------------------------
> >
> > commit edbfcdee046026d3f98592c411a20219b96c8e50
> > Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > Date:   Sun Jan 17 19:09:51 2016 -0800
> >
> >     Add Korean translation to FAQ.txt
> >
> >     Reported-by: SeongJae Park <sj38.park@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >
> > diff --git a/FAQ.txt b/FAQ.txt
> > index 9af9cc0ee3cc..80fe7f282f85 100644
> > --- a/FAQ.txt
> > +++ b/FAQ.txt
> > @@ -166,6 +166,10 @@
> >
> >                 https://sites.google.com/site/kandamotohiro/perfbook
> >
> > +               SeongJae Park has started work on a Korean translation:
> > +
> > +               https://github.com/sjp38/perfbook-ko_KR
> > +
> >  10.    I am working on a translation.  What do I need to do to get my
> >         name of the list in #9 above?
> >
> >
> 

