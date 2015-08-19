Return-Path: <dominik.dingel@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-type:content-transfer-encoding;
 bh=mL3ZenVL7HSV3vjUspRzULRhYMEz+fMaOr30OpC7u1E=;
 b=hGGr17a2KrPXquxuz+hZqXJAkZM4n/z472+Sv5ss/1HnZxLCvamdpWmHu+ttum39dp
 u4o7cRAGQbDP4UNBhRnousJSxwUM0tfm1pb3rUojnQtM8C3S1uzgCgL01Vth6gHYXnXN
 T/BpGdqVCYiTQPTXuiKeMyLU7KjWMdakgzVRhUBH8NLEm65bvxtgSOVoeZ+Q8O0X9thW
 VwiKRrymXINl5hEcBZ+6CLg6uYgdpexP/RVcykbBO+mIeswujVA1w80xkyeaYEIFGnhi
 p+bMcQ7ls1Wo6f7hpQoYigR9exDam3+ZNftmBhWwN/RF28SykRFSEc4A4t9SUtM42mGF
 YLjw==
Date: Wed, 19 Aug 2015 21:06:04 +0200
From: Dominik Dingel <dominik.dingel@gmail.com>
Subject: Re: [PATCH 0/2] CodeSample: rwdeq
Message-ID: <20150819210604.7186b80c@BR9TG4T3.de.ibm.com>
In-Reply-To: <20150817062219.GA2380@linux.vnet.ibm.com>
References: <1439366124-18185-1-git-send-email-dominik.dingel@gmail.com>
 <20150813164300.GB3895@linux.vnet.ibm.com>
 <20150817062219.GA2380@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Dominik Dingel <dingel@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 16 Aug 2015 23:22:19 -0700
"Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:

> On Thu, Aug 13, 2015 at 09:43:01AM -0700, Paul E. McKenney wrote:
> > On Wed, Aug 12, 2015 at 09:55:22AM +0200, Dominik Dingel wrote:
> > > From: Dominik Dingel <dingel@linux.vnet.ibm.com>
> > > 
> > > Hi all,
> > > 
> > > here is a somehow naive implementation of a reader/writer lock based approch
> > > for the parallel deq problem.
> > > 
> > > The next step would be to use it as an introduction example in the text, as due
> > > its way of implementation (taking always a read lock, working always with an
> > > atomic counter) it is a less efficient way of doing things, compared with the
> > > tandem approch. Then the benefits of partitioning might be even more obvious.
> > > 
> > > Thanks
> > > 	Dominik
> > 
> > Queued, thank you, Dominik!
> > 
> > A quick unscientific run leads me to believe that this is slightly faster
> > than the hashed implementation (not bad!), but about twice as slow as
> > the tandem version.  Of course, considerable variation is to be expected
> > based on workload.

Sounds good, during sniff tests I saw even slightly less performance than your hashed implementation. 

> And, as discussed earlier, here the commit adding a Quick Quiz referring
> to your algorithm.  Thoughts?

Looks good! Thanks for putting it in.
My plan, as soon as I get to:
- Rework the section to start with my solution
- Show the disadvantages of my solution
  -> Atomic and read/writer lock (resulting in bouncing cache lines)
- Show your tandem solution which will avoid that overhead and will only
in the worst case really do synchronization of the complete data structure.

What do you think?

Thanks
	Dominik

> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
>     Add Quick Quiz for Dominik Dingel's solution
>     
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
> index a44c285ce134..5d46e70028aa 100644
> --- a/SMPdesign/partexercises.tex
> +++ b/SMPdesign/partexercises.tex
> @@ -683,6 +683,15 @@ Michael~\cite{DBLP:conf/europar/Michael03}.\footnote{
>  	Instead, the common compare-and-swap (e.g., x86 cmpxchg)
>  	suffices.}
>  
> +\QuickQuiz{}
> +	Why are there not one but two solutions to the double-ended queue
> +	problem?
> +\QuickQuizAnswer{
> +	There are actually at least three.
> +	The third, by Dominik Dingel, makes interesting use of
> +	reader-writer locking, and may be found in \co{lockrwdeq.c}.
> +} \QuickQuizEnd
> +
>  In fact, as noted by Dice et al.~\cite{DavidDice:2010:SCA:HTM:deque},
>  an unsynchronized single-threaded double-ended queue significantly
>  outperforms any of the parallel implementations they studied.
> diff --git a/qqz.tex b/qqz.tex
> index 57cdc43f63d1..cfd0356854b7 100644
> --- a/qqz.tex
> +++ b/qqz.tex
> @@ -2561,6 +2561,14 @@ ret = ~ret & tmp;
>  	it is worthwhile) is left as an exercise for the reader.
>  
>  \QuickQ{}
> +	Why are there not one but two solutions to the double-ended queue
> +	problem?
> +\QuickA{}
> +	There are actually at least three.
> +	The third, by Dominik Dingel, makes interesting use of
> +	reader-writer locking, and may be found in \co{lockrwdeq.c}.
> +
> +\QuickQ{}
>  	The tandem double-ended queue runs about twice as fast as
>  	the hashed double-ended queue, even when I increase the
>  	size of the hash table to an insanely large number.
> 

