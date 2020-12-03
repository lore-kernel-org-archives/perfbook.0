Return-Path: <SRS0=p2Uu=FH=gmail.com=kanda.motohiro@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=+jjMf37l+OcMLVB4vqe1JqwAaH0zo11AwPh+y/TSAS8=;
        b=Gujo2O08wr5ReCar5EpafSGmY4DY1Jnbt1O2/q0/F9bUNASepBPiyv33jb9b9qtNYB
         /rp9fjfDZG/geQoqUvTgxecZPht6PvtiAqbO9LR7+z9J3n/ETRtrY6c3u2WzyrtATnJH
         OhW2ztO/HDUZvkmZycmgR6pILlmIBZOE45PF+mo9ZtKOYiRbAeaWkdI9rNCspRTuARDM
         geEN7UN4bL3xtQ2J685AQP2lWBNALQs4o3oAPxE+EI04wLcQqXTPPm/8AUXR0TA8su8s
         gnPN+Sju2BmVEgBXwhauzLU43awa+4lW7/NWHQf3qwwWP0rz9v90L+TvTcTUrpw3V8Oe
         Ochw==
MIME-Version: 1.0
In-Reply-To: <99ea974f-8788-c2e5-5544-e7e708ad2553@gmail.com>
References: <99ea974f-8788-c2e5-5544-e7e708ad2553@gmail.com>
From: Motohiro Kanda <kanda.motohiro@gmail.com>
Date: Thu, 3 Dec 2020 20:04:56 +0900
Message-ID: <CAGfuzXRydh2x5pmqs-heL8wqmDSiV6XYFyyBXHK2+1Z4UPF27w@mail.gmail.com>
Subject: Re: [PATCH -perfbook] whymb: Fix description of compiler mischief
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi, all

> Motohiro, do you mind if I submit patches to Paul on behalf of

Certainly, please submit patches.

While I was working on Japanese translation, I felt something odd with this
smp_mb sample code, but I did not report one to upstream because I was
not so sure.
I just left a comment on my translation.

It is my great pleasure that someone reads my translation so seriously, Akira.

Thanks again for great book, Paul and others!

--
Motohiro Kanda

2020-12-02 23:50 GMT+09:00, Akira Yokosawa <akiyks@gmail.com>:
> From 89ab8426f9821b6a8bf86e9d4f7eb596e0cfed73 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 2 Dec 2020 07:35:08 +0900
> Subject: [PATCH -perfbook] whymb: Fix description of compiler mischief
>
> In this code snippet, the assertion can not fire due to different
> reasons.
> When bar() observes b == 1, the smp_mb() assures a == 1.
> When bar() observes b == 0, the while loop will loop forever and
> the assertion can't be reached.
>
> This was pointed out by Motohiro Kanda in his Japanese translation
> of perfbook [1].
>
> [1]:
> https://sites.google.com/site/kandamotohiro/perfbook-d/perfbookappendixf10
>
> Cc: Motohiro Kanda <kanda.motohiro@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
>
> (Cc: Motohiro)
>
> Looks like this inconsistency in the Answer to Quick Quiz has
> been Motohiro's translation note for quite a while.
> (since 2017?)
>
> He contributed to perfbook in the past.  There is a couple of
> commits with his Reported-by.
>
> Motohiro, do you mind if I submit patches to Paul on behalf of
> you like this?
>
> And I think Paul is likely to do some wordsmithing on top of
> this patch. ;-)
>
>         Thanks, Akira
> --
>  appendix/whymb/whymemorybarriers.tex | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/appendix/whymb/whymemorybarriers.tex
> b/appendix/whymb/whymemorybarriers.tex
> index dff7fafc..301342f3 100644
> --- a/appendix/whymb/whymemorybarriers.tex
> +++ b/appendix/whymb/whymemorybarriers.tex
> @@ -1152,7 +1152,10 @@ void bar(void)
>  }
>  \end{VerbatimN}
>
> -	Given this optimization, the assertion could clearly fire.
> +	Given this optimization, the code would behave in a completely
> +	different way than the original intention.
> +	If \co{bar()} observed \qco{b == 0}, the assertion could not
> +	be reached due to the infinite loop.
>  	You should use volatile casts or (where available) C++
>  	relaxed atomics to prevent the compiler from optimizing
>  	your parallel code into oblivion.
> --
> 2.17.1
>
>
