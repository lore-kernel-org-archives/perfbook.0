Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MgWsUYdhd2JdGXpHjwId3sFVp21f0Z3bU/2Hi+Z+D38=;
        b=FjhT9tBSrpbUWR5Q59OmAywn+6075SqSJ8eAZ/sYM+9CDuh83p332Y2c0SPXTDSqEU
         oDq0AJYsqs+Ps0i9j+W2uXgiPpYnAzYXab2GAa9d1PZMryGGI1/KSRhRZ4MBETA4o/du
         JQtaGDXRAAWgrls7acwf1DSpd19dKENith2PwowK3DUs2Y90+jZp42qfmmLDWslzExeL
         gMs2ruBsgeMH9kncewklsx98L1WOh+m0QcHUxUSFwHgHaDfTbNw/aKP0SvANflCnxuf/
         LZQnro29n+HgaG9ijYnnOatQRFYowWeky3OHtfB6OaCfjpcoaALM8qPSO7fPzWaj47AS
         g16Q==
MIME-Version: 1.0
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
 <7155cb3d-fb2c-f848-a183-1c8dcc0bafa5@gmail.com> <CABoNC83-CFLuHzFurZG6UT=tJFDMzYxGZr-+MrkDPtcCgETa2w@mail.gmail.com>
 <ca2ea462-1e4a-7361-d2f5-48dc7165bdca@gmail.com>
In-Reply-To: <ca2ea462-1e4a-7361-d2f5-48dc7165bdca@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Mon, 14 Jan 2019 22:16:00 +0800
Message-ID: <CABoNC80Bn==eJuUD=uueD+Y44PO6PzgXTWukE2HQj3dN-Z3FLg@mail.gmail.com>
Subject: Re: [PATCH 1/6] datastruct/hash: Simplify hash_resize.c
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, Jan 14, 2019 at 9:22 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Hi Junchang,
>
> On 2019/01/14 18:31:21 +0800, Junchang Wang wrote:
> > FCV_SNIPPET" blocks are used to hide
> > code for debugging
> >
> > On Mon, Jan 14, 2019 at 7:31 AM Akira Yokosawa <akiyks@gmail.com> wrote:
> >>
> >> From 1ffe7edfb90cbb8efb2a33d2ae8c3e855e684acf Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sun, 13 Jan 2019 19:47:23 +0900
> >> Subject: [PATCH 1/6] datastruct/hash: Simplify hash_resize.c
> >>
> >> By keeping updating the current (old) hash table until resizing
> >> completes, hashtab_lookup() only needs to see the current hash table.
> >> Instead, hashtab_add() and hashtab_del() need to update the bucket in
> >> the current hash table as well as that in the new hash table if
> >> hashtab_lock_mod() has locked the new bucket.
> >>
> >> This simplifies the lookup side and no performance degradation
> >> is expected as long as no resizing is in progress.
> >>
> >> Note that during resize operation, the cost of updates can be
> >> doubled in the worst case.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >>  CodeSamples/datastruct/hash/hash_resize.c | 56 ++++++++++++++-----------
> >>  CodeSamples/datastruct/hash/hashtorture.h |  6 ++-
> >>  datastruct/datastruct.tex                 | 69 ++++++++++---------------------
> >>  3 files changed, 59 insertions(+), 72 deletions(-)
> >>
> >> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
> >> index 9f9fe8c..e475910 100644
> >> --- a/CodeSamples/datastruct/hash/hash_resize.c
> >> +++ b/CodeSamples/datastruct/hash/hash_resize.c
> >> @@ -30,7 +30,9 @@
> >>  struct ht_elem {
> >>         struct rcu_head rh;
> >>         struct cds_list_head hte_next[2];               //\lnlbl{ht_elem:next}
> >> -       unsigned long hte_hash;
> >> +#ifndef FCV_SNIPPET
> >> +       unsigned long hte_hash[2];
> >> +#endif /* #ifndef FCV_SNIPPET */
> >
> > Hi Akira,
> >
> > I understand that the micro FCV_SNIPPET is used to hide code for
> > checking hash value in this patch set. I just curious about the exact
> > meaning of the term FCV_SNIPPET itself. Specifically, what does the
> > acronym FCV stand for? I encountered it multiple times while checking
> > the code of perfbook, but didn't find any documentation.
>
> Brief documentation is given in the header of utilities/fcvextract.pl.
> "FCV" came from a LaTeX package name "fancyvrb".
> The macro FCV_SNIPPET is not supposed to be actually defined.
> In this particular case, defining it can eliminate the code
> to check hash values.
>
> Does this short answer make sense to you?
>
Hi Akira,

Yes, it's pretty clear; now I know where the term FCV comes from. :-)
Thanks a lot.


--Junchang


> To add explanation of FCV_SNIPPET and other new features of
> fcvextract.pl in the style guide is on my to-do list.
>
>         Thanks, Akira
>
> >
> > Thanks,
> > --Junchang
> >
> >
> [...]

