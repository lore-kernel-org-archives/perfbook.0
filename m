Return-Path: <SRS0=UzkD=UM=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hooVUpZlAdoiJlkD4zPIg2CA4JJsIAI+GgeqqzAUYYM=;
        b=JCNdbuEXV5wp0Qb4JcVWsRpgOBb/3txzscRDinSBmqKy2f6RkCP8Y46J8HxGBCZcOw
         Mm2T2TFfA7GeREzjhGJuuqDf9BI8qYiQGfJa3IQHC7tIxR/B+Zfb5iyYyKvAnMjjiYzO
         zC878u1eU1PdJ2bGl2AnPNjazNL63zcD4mGIYQR5Sq9VU40dumK2VGTZLBOJPDF1swLf
         +DYEYVfq5YsdbuYdkdIYTAfpT4Pz0MUA1/Jim27ZEMCguFrPvTicGvb3cm8srE6WLSV8
         T+Omp33sMcfkte6kquBcBMl8zWSpBSVORQl1LROyDrMr9hjPQ1EkL8wUSAkssHgG2F30
         9bfw==
MIME-Version: 1.0
References: <CA+PpKPnDa8T_VDgbc-C_TEEYjocrvRems+6aorUcbucRXV73rg@mail.gmail.com>
 <20220402153611.GJ4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220402153611.GJ4285@paulmck-ThinkPad-P17-Gen-1>
From: Hao Lee <haolee.swjtu@gmail.com>
Date: Sun, 3 Apr 2022 00:06:54 +0800
Message-ID: <CA+PpKPnp0e+UTc5mS3RRXVpsr2x0u6jBEy=cP2rUCp4SQfy79A@mail.gmail.com>
Subject: Re: Question about formula (4.1)
Content-Type: text/plain; charset="UTF-8"
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, Apr 2, 2022 at 11:36 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Sat, Apr 02, 2022 at 03:57:01PM +0800, Hao Lee wrote:
> > Hello,
> >
> > I'm confused about Figure 4.2 and the formula (4.1).
> >
> > Anyone can clarify the confusion? Thanks.
> >
> > On page 56, the book says:
> >
> > 1. LN is the number of lock acquisitions by N threads.
> >
> > Question: Does this mean LN = sum of all the readcounts[i] ?
>
> Yes.
>
> > 2. L1 is the number of lock acquisitions by a single thread
> >
> > Question: which thread is L1 corresponding to? Is "a single thread"
> > selected randomly?
>
> No, L_1 corresponds to the number of acquisitions of a single thread
> in a run where only that one thread was running.

Very clear explanation! Thanks!

>
> And now that you mention it, the text does not make that at all clear,
> so please accept my apologies for the unclarity.
>
> Does the change below help?
>
> The resulting text is:
>
>         where N is the number of threads in the current run, L_N is
>         the total number of lock acquisitions by all N threads in the
>         current run, and L_1 is the number of lock acquisitions in a
>         single-threaded run.

Yes. This paragraph is more accurate than before.

Thanks,
Hao Lee

>
> Where the LaTeX "_" subscript operator is used in place of real
> subscripts.
>
>                                                 Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 432a94b0b7e1436a00587a0988fb678def465882
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Sat Apr 2 08:30:43 2022 -0700
>
>     toolsoftrade: Clarify rwlock efficiency formula description
>
>     Reported-by: Hao Lee <haolee.swjtu@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 833ec697..d6662f8c 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -890,9 +890,10 @@ The actual value plotted is:
>  \begin{equation}
>         \frac{L_N}{N L_1}
>  \end{equation}
> -where $N$ is the number of threads,
> -$L_N$ is the number of lock acquisitions by $N$ threads, and
> -$L_1$ is the number of lock acquisitions by a single thread.
> +where $N$ is the number of threads in the current run,
> +$L_N$ is the total number of lock acquisitions by all $N$ threads in the
> +current run, and
> +$L_1$ is the number of lock acquisitions in a single-threaded run.
>  Given ideal hardware and software scalability, this value will always
>  be 1.0.
>
