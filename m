Return-Path: <SRS0=J6Fr=BK=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684655668; x=1687247668;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIKlEEOAYb5rs8Db6iudb+zu9vmfOwIAyqrOVnRpM8I=;
        b=iWWnI7G5jYBFEuiAjSkfEJhbQ0BGc1HZONUbWX9TqPl3z57ijd+ahIapmMbwA4Wbao
         JT3kr+qhPXCp2YDVtFcxXPJ8GmB0yOWDm2BPZL271NKA4hbf95fzq5Kxxwa2Nl4KzFq0
         D1eU64Q6UCkDazaODNKDihF/B5TXdIi31qQbi6tgO+3Z2vaao5aHQKXYWvCIUMZmfjMN
         v0PFzVcq/IqWu9keq0H0cF/e277tOWWoNe/UikGXgooPDer1slm1KJJNZ3Be005NOfKH
         Rxo0hYHUIFvYb09duTujX+vgqdVfq9IIMWYX4Zo5y5d5T3/C7myRlDnMYjqV156Tcjm0
         /NGw==
Date: Sun, 21 May 2023 07:54:25 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: Re: A question about QuickQuiz 5.46
Message-ID: <20230521075425.GA13425@haolee.io>
References: <20230517120110.GA23586@haolee.io>
 <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
 <20230519062847.GA17791@haolee.io>
 <cab1b46a-a147-ce4c-18c8-0b7b76d675b0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cab1b46a-a147-ce4c-18c8-0b7b76d675b0@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, May 19, 2023 at 10:27:48PM +0900, Akira Yokosawa wrote:
> On Fri, 19 May 2023 06:28:47 +0000, Hao Lee wrote:
> > On Thu, May 18, 2023 at 10:50:51AM +0900, Akira Yokosawa wrote:
> >> Hi,
> >>
> >> On Wed, 17 May 2023 12:01:10 +0000, Hao Lee wrote:
> >>> Hi, Paul
> >>>
> >>> I noticed that QuickQuiz 5.46 is causing confusion due to the fact that
> >>> balance_count() and flush_local_count() are both located within the
> >>> slowpath and are called sequentially. As a result, it is impossible for
> >>> them to compete for the counterandmax thread-local variable.
> >>
> >> Right.
> >> And that's exactly what is mentioned in the answer to the quiz.
> >>
> >> I guess it confused you because you didn't expect such an easy one,
> >> no ? :-)
> > 
> > In fact I'm confused about the question description.
> > I believe that this quiz should focus on the concurrency of global
> > variables, rather than on the concurrency of the atomic variable
> > `counterandmax`, which is currently the main focus of the description.
> 
> Hmm, sorry but I'm afraid I don't get your point ...
> 
> Could you share the question you'd expect to see in place of
> Quick Quiz 5.46?

Hi, I don't think this question should exist according to my
understanding...

Let's approach this question from a different perspective. The answer
emphasizes that the gblcnt_mutex prevents concurrency problems. Let's
assume that neither balance_count() nor flush_local_count() is holding
the gblcnt_mutex. Would the counterandmax variable encounter concurrency
problems? I don't think so because counterandmax is an atomic variable
and is always safe, even without using any locks.

> 
>         Thanks, Akira
> 
> > 
> >>
> >>         Thanks, Akira
> >>
> >>>                                                               Therefore,
> >>> I believe that this quiz may be referring to the global variables
> >>> globalcount and globalreserve.
> >>>
> >>> Thanks,
> >>> Hao Lee
