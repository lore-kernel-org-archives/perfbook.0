Return-Path: <dominik.dingel@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-type:content-transfer-encoding;
 bh=m7p9LExGwDMlrk7DW8OlSSxQVjE6aCNZQACJktgHK6g=;
 b=TDV143ylhr0hBiHEvSzmuVOQ5EfcYtdr/2cDV/LRn75SUrTbDrfeOoOXxfZ+zWT0tL
 mYsi/ihOkr8Y1SivhN9ynWwWPjk8pb5qKSyThalSQGWo5ygQZh1toaGuHlOgMmBOAesx
 auDaA4KFFQdGD/MtSpjTT5aYF0QQ92M46c0mXyAhZV/LMf2omdNgjPtnR3G/fptiUgLE
 78B8X2Q1i4KDjdyLktsd6GAY1EmvDdD/UgKh+tr1aOwlEDof34Zfvj7r3TXII1ebx7sO
 I0nE/RA0JFfaLuecrJDarbagxCxmjcVx8X9eb1wHkNjVMRnt2jLzvDIcQXyS6D9hMfWd
 FSkw==
Date: Thu, 20 Aug 2015 19:36:14 +0200
From: Dominik Dingel <dominik.dingel@gmail.com>
Subject: Re: [PATCH 0/2] CodeSample: rwdeq
Message-ID: <20150820193614.5a35129a@BR9TG4T3.de.ibm.com>
In-Reply-To: <20150819212203.GE11078@linux.vnet.ibm.com>
References: <1439366124-18185-1-git-send-email-dominik.dingel@gmail.com>
 <20150813164300.GB3895@linux.vnet.ibm.com>
 <20150817062219.GA2380@linux.vnet.ibm.com>
 <20150819210604.7186b80c@BR9TG4T3.de.ibm.com>
 <20150819212203.GE11078@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Dominik Dingel <dingel@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 19 Aug 2015 14:22:03 -0700
"Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:

> On Wed, Aug 19, 2015 at 09:06:04PM +0200, Dominik Dingel wrote:
> > On Sun, 16 Aug 2015 23:22:19 -0700
> > "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> > 
> > > On Thu, Aug 13, 2015 at 09:43:01AM -0700, Paul E. McKenney wrote:
> > > > On Wed, Aug 12, 2015 at 09:55:22AM +0200, Dominik Dingel wrote:
> > > > > From: Dominik Dingel <dingel@linux.vnet.ibm.com>
> > > > > 
> > > > > Hi all,
> > > > > 
> > > > > here is a somehow naive implementation of a reader/writer lock based approch
> > > > > for the parallel deq problem.
> > > > > 
> > > > > The next step would be to use it as an introduction example in the text, as due
> > > > > its way of implementation (taking always a read lock, working always with an
> > > > > atomic counter) it is a less efficient way of doing things, compared with the
> > > > > tandem approch. Then the benefits of partitioning might be even more obvious.
> > > > > 
> > > > > Thanks
> > > > > 	Dominik
> > > > 
> > > > Queued, thank you, Dominik!
> > > > 
> > > > A quick unscientific run leads me to believe that this is slightly faster
> > > > than the hashed implementation (not bad!), but about twice as slow as
> > > > the tandem version.  Of course, considerable variation is to be expected
> > > > based on workload.
> > 
> > Sounds good, during sniff tests I saw even slightly less performance than your hashed implementation. 
> 
> It is probably possible to construct a workload that makes either look
> good or bad.  ;-)
> 
> > > And, as discussed earlier, here the commit adding a Quick Quiz referring
> > > to your algorithm.  Thoughts?
> > 
> > Looks good! Thanks for putting it in.
> > My plan, as soon as I get to:
> > - Rework the section to start with my solution
> > - Show the disadvantages of my solution
> >   -> Atomic and read/writer lock (resulting in bouncing cache lines)
> > - Show your tandem solution which will avoid that overhead and will only
> > in the worst case really do synchronization of the complete data structure.
> > 
> > What do you think?
> 
> I was actually planning to push the hashed version to either a quick
> quiz or an appendix in order to make room for other sections to
> expand.  One approach would be to put both your implementation and
> the hashed implementation in the "Important Questions" section for
> the second edition.


Sounds reasonable. You have any time for releasing in mind?


> Later on, I am thinking in terms of a supplement of some sort, so that
> the main book stays at roughly 500 pages, but so that people can
> go look at additional material if they want.  Thoughts?
> 
> 							Thanx, Paul

I encourage to go that way, so people really want to dive deep can do so,
while at the same time you do not scare potential readers, right?

Thanks
	Dominik

> > Thanks
> > 	Dominik
> > 
> > > 							Thanx, Paul
> > > 
> > > ------------------------------------------------------------------------
> > > 
> > >     Add Quick Quiz for Dominik Dingel's solution
> > >     
> > >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > > 
> > > diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
> > > index a44c285ce134..5d46e70028aa 100644
> > > --- a/SMPdesign/partexercises.tex
> > > +++ b/SMPdesign/partexercises.tex
> > > @@ -683,6 +683,15 @@ Michael~\cite{DBLP:conf/europar/Michael03}.\footnote{
> > >  	Instead, the common compare-and-swap (e.g., x86 cmpxchg)
> > >  	suffices.}
> > >  
> > > +\QuickQuiz{}
> > > +	Why are there not one but two solutions to the double-ended queue
> > > +	problem?
> > > +\QuickQuizAnswer{
> > > +	There are actually at least three.
> > > +	The third, by Dominik Dingel, makes interesting use of
> > > +	reader-writer locking, and may be found in \co{lockrwdeq.c}.
> > > +} \QuickQuizEnd
> > > +
> > >  In fact, as noted by Dice et al.~\cite{DavidDice:2010:SCA:HTM:deque},
> > >  an unsynchronized single-threaded double-ended queue significantly
> > >  outperforms any of the parallel implementations they studied.
> > > diff --git a/qqz.tex b/qqz.tex
> > > index 57cdc43f63d1..cfd0356854b7 100644
> > > --- a/qqz.tex
> > > +++ b/qqz.tex
> > > @@ -2561,6 +2561,14 @@ ret = ~ret & tmp;
> > >  	it is worthwhile) is left as an exercise for the reader.
> > >  
> > >  \QuickQ{}
> > > +	Why are there not one but two solutions to the double-ended queue
> > > +	problem?
> > > +\QuickA{}
> > > +	There are actually at least three.
> > > +	The third, by Dominik Dingel, makes interesting use of
> > > +	reader-writer locking, and may be found in \co{lockrwdeq.c}.
> > > +
> > > +\QuickQ{}
> > >  	The tandem double-ended queue runs about twice as fast as
> > >  	the hashed double-ended queue, even when I increase the
> > >  	size of the hash table to an insanely large number.
> > > 
> > 
> 

