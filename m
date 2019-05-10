Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-it1-f176.google.com ([209.85.166.176]:51508 "EHLO
        mail-it1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727562AbfEJSpe (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 10 May 2019 14:45:34 -0400
Received: by mail-it1-f176.google.com with SMTP id s3so10973492itk.1
        for <perfbook@vger.kernel.org>; Fri, 10 May 2019 11:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IIUnYNRm79Kaz8K3sY35nVeVkECjJ1J7kj60EEIs5Sg=;
        b=bDyXIJCJLteVAuXenPFzCyojL3o5/enile3zlxMnv/7nsTt1XLqrNpLyD9JgCiZWO4
         R59ONk4895nWC66d/14fJqsO8c2oycgZr6flGOKfeOJ0lX3yFQqoKwg5D7yoRXYR03GB
         Tx08IK5YVlCf2uj7KHa7OXn1Gs999WIaNc8RTOfhm4kqA9kgW9ncACeJW7PxBTo48kko
         DgSmrUle2VSrMxJUzSO9p4YJ8V4XdVvQxpPevqDvRDanakYwmruBUto5te5XSOHKUJkn
         ezudqkaeaAIEPtDh+ydw7c5B0oPtenmYh5ma/rvsQ0H6W3FbFmQkpsJNSG61VCN6a++k
         ytvA==
MIME-Version: 1.0
References: <CAJbg=FWSV6akb4g7Kt8-sNt-mnLUZ25MHZ=bPQuEfd6PEUY0NQ@mail.gmail.com>
 <ecddd9c0-72b5-0b3d-a79c-f05029085658@gmail.com>
In-Reply-To: <ecddd9c0-72b5-0b3d-a79c-f05029085658@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Fri, 10 May 2019 14:45:22 -0400
Message-ID: <CAJbg=FU2MJ80umO3xQ9-q62dWfvXu4U777UcUV_E01Z6Tkk-xg@mail.gmail.com>
Subject: Re: Single-threaded accesses and signal handlers
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

> Nice catch! It would be more than welcome if you could contribute in
> a properly formatted patch by using "git format-patch".

Oops, sorry. I'll do that in the future.

--Elad

On Fri, 10 May 2019 at 11:56, Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Hi Elad,
>
> On Fri, 10 May 2019 07:35:02 -0400, Elad Lahav wrote:
> > Hello,
> >
> > In a few places in Chapter 4 it is mentioned that a certain access
> > pattern is safe in a single-threaded program.
>
> "thread" in Section 4.3 does not directly match that of pthread.
> You might have already noticed, Paul mostly does Linux kernel
> programming and his choice of words can be incompatible with
> your perspective.
>
> >                                               In many (most?)
> > Unix-like operating systems signal handlers in an otherwise
> > single-threaded process execute in the context of that single thread.
> > Nevertheless the signal handler represents a conceptually separate
> > stream of execution that is subject to similar race conditions as
> > those that occur in "true" multi-threaded programs. The situation is
> > even worse with signal handlers as standard locks typically cannot be
> > used to protect the access to shared data.
> > It may be worthwhile to mention this pitfall.
>
> FYI, locking and signal handlers are covered in Section 7.1.1.8.
> I have no idea if discussion there can satisfy you, though.
>
> >
> > Also, a small typo in "Shared-Variable Shenanigans":
> >
> > --- a/toolsoftrade/toolsoftrade.tex
> > +++ b/toolsoftrade/toolsoftrade.tex
> > @@ -1550,7 +1550,7 @@ Of course, where practical, the primitives described in
> >  Section~\ref{sec:toolsoftrade:Atomic Operations (gcc Classic)}
> >  or (especially)
> >  Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}
> > -should be instead be used to avoid data races, that is, to ensure
> > +should instead be used to avoid data races, that is, to ensure
> >  that if there are multiple concurrent accesses to a given
> >  variable, all of those accesses are loads.
> >
>
> Nice catch! It would be more than welcome if you could contribute in
> a properly formatted patch by using "git format-patch".
>
>         Thanks, Akira
>
> > --Elad
> >
>

