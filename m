Return-Path: <SRS0=XCeE=Z6=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BLfrWwoPqTUyja/Ay6wAYfesKhRchK0Eb6RI9w7V4gE=;
        b=LWEP9qlQvVvlP39ADSIfzW+3JiXLRd1pMLLsp3N54uGgBm6HUGyoIuosUrx8AubaZ0
         dcrrWW5pE+/kJ2me7fYdBh87hzFiUlgfwA3drZL/gP/KteeO7kRT9n37MGSzybiV1aQR
         CNK0fe7jOzu50EHT2kY4bISr8GydUxsihkhoVe0EWMeTCR+mTmQhlXP2g+YeUNlj8ZwI
         VjOAXCiL4E8TXBnBMq66oXcDlKnlVSCYzM+0NJwNzGO+kwTRAnZB3ROPTb0bo1tHNwQf
         363CICT3t0iveRRS1Ygu9BcjWjUa5DKKqvWZueQO/8OBmWcAvTfcsL055Ikrz1XPsRFZ
         nZnQ==
MIME-Version: 1.0
References: <CAJbg=FVkC51pkG_cO-bBgfYq1pcug9B=ECEkmcNHLg+3HDbB4A@mail.gmail.com>
 <20220927190617.GV4196@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220927190617.GV4196@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
Date: Tue, 27 Sep 2022 15:12:51 -0400
Message-ID: <CAJbg=FWoudBKmKBuxfU-hNfcqOq7As75Q8NB732N5-hHpyp7ng@mail.gmail.com>
Subject: Re: Comments on Section 7.1
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

I'll try to come up with a patch that combines 1 and 2. So keep the
qsort() example, but then add something along the lines of:

"If you are not convinced that qsort requires locking in the library,
consider the following example..."

and then

"Note the dangerous situation as the library releases its locks prior
to invoking the user's callback function..."

--Elad

On Tue, 27 Sept 2022 at 15:06, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Mon, Sep 26, 2022 at 09:48:33PM -0400, Elad Lahav wrote:
> > This started out as a longer email, but it looks like at least two of
> > the problems I spotted were already fixed in the latest version.
> >
> > 1. I think the recommendation to release all locks before invoking a
> > user-supplied function should come with a BIG FLASHING WARNING SIGN
> > (or the PDF equivalent). Whenever I review code that releases and
> > re-acquires a lock I look for the faulty assumptions it makes about
> > state being preserved from before the lock was released. 9 out of 10
> > times I find a bug.
>
> Good point!
>
> Left to myself, I would add another infamous Quick Quiz.  But would
> you like to send a patch proposing something?
>
> > 2. qsort() may not be the best example to use in this section, as,
> > even assuming there is some version of it that requires locks, the
> > reader may fail to see any problems. While I'm no fan of nftw(), it
> > may be easier to see why you would need a lock in the library (to
> > prevent changes to the directory), as well as why releasing and
> > re-acquiring the lock can be dangerous (the iterator can become
> > invalid).
>
> This does sound better than qsort, so if no one has a better suggestion, I
> would be tempted to go with that.  In the absence of a better suggestion,
> would you be willing to supply some sample code, preferably buildable
> and executable?
>
> > 3. Page 106, first paragraph: "an pointer" should be "a pointer".
>
> This one was easy, so I applied it with your Reported-by.  Good eyes,
> by the way, and thank you!
>
>                                                         Thanx, Paul
