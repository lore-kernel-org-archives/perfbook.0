Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WMK0nNthD9XSQioNMGYAgLtgkxWWRC1VAMQ5F2OzafE=;
 b=EHoDp8jUnwdkkH4nKub9xczOQ+coZLZD3av85+VzLMYpCF2K+oYsB2/s1guWPMn49l
 tEqZ6b8fI8xiN0nUoOzY/vedXFSvYojG+lhX5Y44GfhTy+goC2Y5xEMtLU0u5c38kNty
 pLv9VkcvLffEOGDb1jYt1wJwCGW+GUjGsZsVywRZn8kXdefrZ6yhG7H3t9jrDUMdzaZB
 z9XmsubwtPXDAqCxy6PyuuwBmXf5xVM04uW287Avwt8oqQGxRPC7oAoXp70/Q7HmcpSu
 Gmr/HcQDXOXnkpBFpkvjSd1Z6oxhgs1czGzCORBh6/7V6aZLpiVaf+pwzFgJjznFhrhY
 zwpQ==
Date: Mon, 8 May 2017 21:25:28 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: The weird re-ordering issue of the Alpha arch'
Message-ID: <20170508132523.GA7570@HP>
References: <20170429142605.GC2536@master>
 <20170501155816.GB3956@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170501155816.GB3956@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, May 01, 2017 at 08:58:16AM -0700, Paul E. McKenney wrote:
> On Sat, Apr 29, 2017 at 10:26:05PM +0800, Yubin Ruan wrote:
> > Hi, 
> > Remember a few weeks ago we discussed about the weird re-ordering issue of the
> > Alpha arch', which is mentioned in Appendix.B in the perfbook? I got really
> > confused at that moment. Paul gave me a reference to a SGI webpage(an email
> > discussion actually), but that wasn't so understandable. Today I found a few
> > words from Kourosh Gharachorloo[1], which are very instructional for me:
> > 
> >     For Alpha processors, the anomalous behavior is currently only possible on a
> >     21264-based system. And obviously you have to be using one of our
> >     multiprocessor servers. Finally, the chances that you actually see it are very
> >     low, yet it is possible.
> >     
> >     Here is what has to happen for this behavior to show up. Assume T1 runs on P1
> >     and T2 on P2. P2 has to be caching location y with value 0. P1 does y=1 which
> >     causes an "invalidate y" to be sent to P2. This invalidate goes into the
> >     incoming "probe queue" of P2; as you will see, the problem arises because
> >     this invalidate could theoretically sit in the probe queue without doing an
> >     MB on P2. The invalidate is acknowledged right away at this point (i.e., you
> >     don't wait for it to actually invalidate the copy in P2's cache before
> >     sending the acknowledgment). Therefore, P1 can go through its MB. And it
> >     proceeds to do the write to p. Now P2 proceeds to read p. The reply for read
> >     p is allowed to bypass the probe queue on P2 on its incoming path (this allow
> >     s replies/data to get back to the 21264 quickly without needing to wait for
> >     previous incoming probes to be serviced). Now, P2 can derefence P to read the
> >     old value of y that is sitting in its cache (the inval y in P2's probe queue
> >     is still sitting there).
> >     
> >     How does an MB on P2 fix this? The 21264 flushes its incoming probe queue
> >     (i.e., services any pending messages in there) at every MB. Hence, after the
> >     read of P, you do an MB which pulls in the inval to y for sure. And you can
> >     no longer see the old cached value for y.
> >     
> >     Even though the above scenario is theoretically possible, the chances of
> >     observing a problem due to it are extremely minute. The reason is that even
> >     if you setup the caching properly, P2 will likely have ample opportunity to
> >     service the messages (i.e., inval) in its probe queue before it receives the
> >     data reply for "read p". Nonetheless, if you get into a situation where you
> >     have placed many things in P2's probe queue ahead of the inval to y, then it
> >     is possible that the reply to p comes back and bypasses this inval. It would
> >     be difficult for you to set up the scenario though and actually observe the
> >     anomaly.
> >     
> >     The above addresses how current Alpha's may violate what you have shown.
> >     Future Alpha's can violate it due to other optimizations. One interesting
> >     optimization is value prediction.
> > 
> > What I want to say is that next time you update the perfbook, you can take a few
> > words from it. I mean, you can adopt the same schema like "Assume T1 runs on P1
> > and T2 on P2. P2 has to be caching location y with value 0....". That would make
> > the perfbook more understandable :)
> 
> Thank you -very- much, Yubin!  I was not aware of this, and you are quite
> correct, it is -much- better than the current citation.

Hmm...that reminds me of some words in the perfbook. In the answer of quick quiz 4.17,
you state that:

    Memory barrier only enforce ordering among multiple memory references: They do
    absolutely nothing to expedite the propogation of data from one part of the system
    to another. This leads to a quick rule of thumb:  You do not need memory barriers
    unless you are using more than one variable to communicate between multiple threads.

Is that only true for the Alpha processor? I mean, on platforms other than
Alpha (e.g x86), memory barrier *do* expedite the propogation of data from one
processor/core to other processor/core, even though that is not officially documented.

---
Yubin

> > 
> > [1]: https://www.cs.umd.edu/~pugh/java/memoryModel/AlphaReordering.html
> > 
> 

