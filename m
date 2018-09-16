Return-Path: <paulmck@linux.vnet.ibm.com>
Date: Sun, 16 Sep 2018 15:02:12 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 2/2] count: Reword Quick Quiz 5.6 to adjust context
Message-ID: <20180916220212.GD652@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <2b7297a8-62d2-bcdb-0b41-e3bb1b270a6e@gmail.com>
 <ce79d51e-2557-b855-d7ee-cc9f22f22958@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce79d51e-2557-b855-d7ee-cc9f22f22958@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, "Palik, Imre" <imrep.amz@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, Sep 15, 2018 at 11:14:03AM +0900, Akira Yokosawa wrote:
> >From 7bf9ee029829a53009e29ea23b287bb874bd8ee4 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 14 Sep 2018 22:50:04 +0900
> Subject: [PATCH 2/2] count: Reword Quick Quiz 5.6 to adjust context
> 
> count_nonatomic.c has lost the explicit "++" operator, so this is
> my humble attempt to update the question.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I adjusted it slightly, then applied and pushed it, thank you!

Could you please double check that I didn't mess something up?

							Thanx, Paul

> ---
> Paul,
> 
> Does this change look reasonable to you?
> I'm quite sure you will come up with something better. ;-)
> 
>     Thanks, Akira
> --
>  count/count.tex | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index cfdacb5..6a48b99 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -193,7 +193,9 @@ Although approximate values do have their place in computing,
>  accuracies far greater than 50\,\% are almost always necessary.
> 
>  \QuickQuiz{}
> -	But doesn't the \co{++} operator produce an x86 add-to-memory
> +	But doesn't a smart compiler prove
> +        line~\ref{ln:count:count_nonatomic:inc-read:inc} is equivalent
> +        to the \co{++} operator and produce an x86 add-to-memory
>  	instruction?
>  	And won't the CPU cache cause this to be atomic?
>  \QuickQuizAnswer{
> -- 
> 2.7.4
> 
> 
