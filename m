Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PISdp9Yf0TP49aTF5ioafuHTgwFaOaqCtTX6EF2oUFw=;
        b=saD96bq4+p0oqtO1yS4DTwBbCZncCu0A89ztoLfYZq7eKZzdcSBl5U1vOAEYfdbf6B
         55EXRnItgs4Qt/uqrS5XTpbHsj67/vMvysss+vBX8fm0vJMV7MRzt9aYBf+63b1WYwoc
         fJmINu8Q5M5pPD2+AB8osIfE8snbPi8GGjRHvSMlPoa2Z6N3tnPF3ydogCoAzw9soJnA
         0jf12IKKPoSnrNt6J9WDIjyOnEki6KqB/UCdVG+LKMpbr77v6eYWMa3FOZYdiKWc9emv
         On+je0X0LzBPa5RBESPPAMiBEi0vXJVoj2UYsefsUksqvNuwAGDkgTeHbSH9rbvEoZuS
         7tKw==
MIME-Version: 1.0
References: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
 <1541330319-14491-2-git-send-email-junchangwang@gmail.com> <20181105194542.GZ4170@linux.ibm.com>
In-Reply-To: <20181105194542.GZ4170@linux.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 6 Nov 2018 14:15:37 +0800
Message-ID: <CABoNC83cYoq3Oh02g=qhX0Sa=o+__a1eoo6nw8HD3-B_qHDv-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] memorder: fix typo
Content-Type: text/plain; charset="UTF-8"
To: Paul McKenney <paulmck@linux.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Nov 6, 2018 at 3:45 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>
> On Sun, Nov 04, 2018 at 07:18:38PM +0800, Junchang Wang wrote:
> > Fix typos in memorder.tex.
> >
> > Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>
> You know, I have no idea what litmus test I was describing in that
> paragraph, but it certainly wasn't the one in Listing 15.17.  :-/
>
> I adjusted things a bit more, so please see below and let me know if
> I messed anything up.
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 73f0f6583b154f2cd9280f321e87dcaabe6b1221
> Author: Junchang Wang <junchangwang@gmail.com>
> Date:   Sun Nov 4 19:18:38 2018 +0800
>
>     memorder: Fix typo
>
>     Fix typos in memorder.tex, including a very confused paragraph that
>     seems to be referring to some prior version of Listing 15.17.
>
>     Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>     [ paulmck: Adjusted rewording of Listing 15.17 discussion. ]
>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
>
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 8e11e92153e0..5e74a912e15d 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1364,7 +1364,7 @@ The head pointer is \co{x1}, which initially
>  references the \co{int} variable \co{y} (line~5), which is in turn
>  initialized to the value $1$ (line~4).
>  \co{P0()} updates head pointer \co{x1} to reference \co{x0} (line~12),
> -but only afer initializing it to $2$ (line~10) and forcing ordering
> +but only after initializing it to $2$ (line~10) and forcing ordering
>  (line~11).
>  \co{P1()} picks up the head pointer \co{x1} (line~21), and then loads
>  the referenced value (line~22).
> @@ -2294,9 +2294,9 @@ These ordering constraints are depicted graphically in
>  Figure~\ref{fig:memorder:Cumulativity}.
>  Note also that cumulativity is not limited to a single step back in time.
>  If there was another load from \co{x} or store to \co{x} from any thread
> -that came before the store on line~13, that prior load or store would also
> -be ordered before the store on line~32, though only if both \co{r1} and
> -\co{r2} both end up containing the address of \co{x}.
> +that came before the store on line~8, that prior load or store would also
> +be ordered before the load on line~25, though only if both \co{r1} and
> +\co{r2} both end up containing the value \co{1}.
>

Hi Paul,

Now the discussion is pretty clear to me. Thanks a lot.


Regards,
--Junchang


>  In short, use of cumulative ordering operations can suppress
>  non-multicopy-atomic behaviors in some situations.
>

