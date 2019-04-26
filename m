Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+aGFN6WDsWTvvwH9/tNNGNshsj/oHEMLMF7fE/idkX8=;
        b=K41vm8umaLfy4m1hk7TPBSxBrHG0gNbqJulMMWT+3twhvNbVYP9RF8FyVdjxWs+iu7
         QspU5Tb9LarCxq1cvoQbK7Ymw4vOxp7XMa3QeYsbAXBlJLBCgNt0KvLwqBO1oOuq9K6r
         2Y5H3SRbr1HLaLB2qEOidzoibBPvB3B8g3QvSl4Q58BbZuQPfVb93C9afU5i3N5/X9I5
         tOJUy8dq6wuT/JDBeiKdEtwi8o5jrx5IsBvXcDP1zuY3J59i1rwX2J9n0dlyDtD+6NGb
         /OEYSMu0RQCyKIWMynXdmP4voZbtXxOKBmBALh+n0ZlmdxP0NiqLGkKIP/To6A69aiED
         FfmQ==
MIME-Version: 1.0
References: <1556180994-16131-1-git-send-email-junchangwang@gmail.com> <95b306ce-9ddb-0ac5-ee5c-077cb4a9a27e@gmail.com>
In-Reply-To: <95b306ce-9ddb-0ac5-ee5c-077cb4a9a27e@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Fri, 26 Apr 2019 16:15:59 +0800
Message-ID: <CABoNC82=A3mrjy8R761V0b0mz1rN2rG4btMbeb6Shrp0nT_qNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Toyrcu: replace plain accesses with READ_ONCE() and
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, Apr 25, 2019 at 11:38 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Hi Junchang,
>
> On Thu, 25 Apr 2019 16:29:51 +0800, Junchang Wang wrote:
> > Hi Paul and Akira,
> >
> > This patch set replaces plain accesses and ACCESS_ONCE() with READ_ONCE()
> > and WRITE_ONCE() in Toy RCU examples. I will send another patch updating
> > tex file accordingly on top of this patch set.
>
> As far as accesses to rcu_gp_ctr, this patch set looks good to me.
>
> In updating toyrcu.tex file, I suggested to extract the snippets from
> code under CodeSamples/defer, but some snippets in toyrcu.tex consist of
> code from both .h and .c. Current scheme does not support such merging
> of snippets from multiple source files.
>
> Your option is to manually convert verbbox environment to Verbatim
> environment. Sorry I suggested infeasible extractions the other day.
> rcu_qs.c and rcu_qs.h are in separate snippets, and they can be
> extracted by fcvextract.pl. In this case, commit 4a41491166cd
> ("defer/hazptr: Extract snippet from hazptr.c") should be a good example,
> especially the "gobbleblank=yes" option.
>
> If you have any question, feel free to ask me. I'm looking forward to
> seeing your update.

Hi Akira,

Thanks for the note. Would be happy to submit a new patch for
toyrcu.tex according to your suggestions soon.

>
> Paul, in the sources Junchang has touched, per-thread variable
> "rcu_reader_gp" is updated by its owner, but is read accessed from
> for_each_thread loops in updater side. So I think accesses to each of
> them need to be annotated by WRITE_ONCE (in owner) and READ_ONCE (in updater).
> I looked at only the diffs in the 1st patch set and didn't notice the raciness
> of them.
>
> Macros for accessing per-thread variables are expanded to array references,
> and there are "barrier()"s in these loops.
> So I think there is little chance those accesses would be optimized by
> currently available compilers.
>

Great catch! My understanding is that one of the nice benefits of
READ_ONCE/WRITE_ONCE is that they explicitly notify programmers the
spots where there might be racy accesses. The more we eliminate them,
the harder a programmer verifies the code. Of course, that's my
current point of view. I would be happy to see your choices.

Thanks,
--Junchang

> Do you see the need to annotate the accesses to per-thread variable?
>
>         Thanks, Akira
>
> >
> > --
> > Junchang Wang (3):
> >   rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
> >   rcu_nest: Use READ_ONCE() and WRITE_ONCE() for shared variable
> >     rcu_gp_ctr
> >   rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared variable
> >     rcu_gp_ctr
> >
> >  CodeSamples/defer/rcu.c      | 2 +-
> >  CodeSamples/defer/rcu.h      | 4 ++--
> >  CodeSamples/defer/rcu_nest.c | 2 +-
> >  CodeSamples/defer/rcu_nest.h | 2 +-
> >  CodeSamples/defer/rcu_qs.c   | 2 +-
> >  CodeSamples/defer/rcu_qs.h   | 4 ++--
> >  6 files changed, 8 insertions(+), 8 deletions(-)
> >
>

