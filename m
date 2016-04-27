Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:33752 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752310AbcD0WuP (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 27 Apr 2016
 18:50:15 -0400
Received: from localhost	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Wed, 27 Apr
 2016 16:50:14 -0600
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 1AE393E40041	for <perfbook@vger.kernel.org>; Wed, 27 Apr 2016 16:49:45 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3RMniHb33751194	for <perfbook@vger.kernel.org>; Wed, 27 Apr 2016 22:49:44
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3RMniUS012984	for <perfbook@vger.kernel.org>; Wed, 27 Apr 2016 18:49:44
 -0400
Date: Wed, 27 Apr 2016 15:50:22 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Some questions
Message-ID: <20160427225022.GK4967@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <c95dbdd5-69f5-76f3-b678-08e78032ffd2@gmail.com>
 <20160427165357.GD4967@linux.vnet.ibm.com>
 <2b39d2d5-962b-ce05-aa59-5569abdc4049@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b39d2d5-962b-ce05-aa59-5569abdc4049@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 28, 2016 at 07:15:05AM +0900, Akira Yokosawa wrote:
> On 2016/04/27 09:53:57 -0700, Paul E. McKenney wrote:
> > On Thu, Apr 28, 2016 at 12:21:48AM +0900, Akira Yokosawa wrote:
> > [snip]
> > 
> >> However, the newly added Table 14.2 "A Variable With More Simultaneous Values"
> >> seems like it is not complete yet.  Is that the case?
> > 
> > Please see attached for what it looks like to me.
> 
> Well, this is identical to the one I built.
> So, do you intend to explicitly put numbers which show up fairly long time, and
> leave other cells blank even below changes of values denoted by (n) in italics?

The blank cells represent cache misses.  The CPU is waiting for a read
to complete during that time.  A non-blank cell corresponds to a CPU
actually completing a read.

> >> Looks like you used some custom script or something to generate the table
> >> from a raw data that contains when each cpu sees the updates.
> >>
> >> Do you have a plan to replace the Table with a Figure something like
> >> Figure 14.5 "A Variable With Multiple Simultaneous Values"?
> > 
> > I briefly considered coloring the table cells, but got distracted.
> 
> That kind of work would be made easy if you make a script or something to
> generate the latex source of the table. The problem is the script itself
> might take time to make it work properly. I could be of help in that area. 

I probably do have something somewhere...  No guarantees of finding it...

> > I am not sure that making a 14.5-like barchart would be all that
> > readable...  But please feel free to prove me wrong.
> 
> There would be a number of very narrow bars hard to recognize.
> It would also be impossible to see there are fourteen different opinions
> at time 20. Yes, a table seems a better way to represent this.

Not sure that there is a really good way to represent this, but again,
please feel free to prove me wrong!  A nicer representation would be a
very good thing.

							Thanx, Paul

> >> If you do, I'll refrain from touching the Table. Rather, I'd be interested
> >> in improving the script you might be using, if any.
> >>
> >> Another totally unrelated question is about the URL you placed in
> >> Section C.7: "http://www.openvms.compaq.com/wizard/wiz_2637.html".
> >> Sadly, this URL is no longer valid. Do you happen to aware of an alternative
> >> URL still accessible today?
> > 
> > This one: http://h71000.www7.hp.com/wizard/wiz_2637.html
> > 
> >> By looking up a Wikipedia article, I found a page at
> >> http://h18002.www1.hp.com/alphaserver/technology/chip-docs.html,
> >> which is "Archived technical documentation library" of Alpha
> >> containing links to technical documentation for Alpha microprocessors
> >> and Alpha ATX motherboards. Is there a document there which can be
> >> referred to instead of the above mentioned URL?
> > 
> > Ah, I see...  I blew it and included the URL verbatim in the text.
> > It should be replaced with \cite{Compaq01}.
> > 
> > Fixed, with your Reported-by!  Thank you!
> 
> Oh, you are most welcome!
>                                                    Thanks, Akira
> > 
> > 							Thanx, Paul
> > 
> 

