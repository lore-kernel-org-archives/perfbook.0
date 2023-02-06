Return-Path: <SRS0=8Upf=6C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eivAeZY170HTwC+HtA9wzsSQEEzQW0AlGWj8R8Rdrg0=;
        b=IkYY2Tb8Okthzb8KXgW7rFvmD7/wSQyTUcrjI7k/5/QMVU/xZDF4TPphGLKlO50rra
         XsLDmvorSro96wJcaBIOZplwH+2LM+BRrx0qLKdxphcgT72fA9F+pGEL5HgD93u+hQFb
         4vdE1hGt77k8rCJuESe+lMLaIzBU6aT+G/1otZePwbevZ6ANo/gCH8XSpQol/Yx7m58F
         4CV/3u7IYgbJ9ZcG28s853a5IbXtYLhZfIdMmp3fyK0tQF8KAbWmqxfRvYpMIbJe9RF5
         QaOd+zJTBqdTjbyRPOvyhg+//G6vmjRViWxXAsUfiONVILSZeW3B7UGdNzk48/qz5KkT
         /NIQ==
Message-ID: <10bf2033-3b80-24a0-ffd5-0fe51306250b@gmail.com>
Date: Mon, 6 Feb 2023 11:48:50 +0900
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] debugging: Use \co{} for rcutorture
Content-Language: en-US
References: <20230205182128.19044-1-sj@kernel.org>
 <20230205182128.19044-4-sj@kernel.org>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230205182128.19044-4-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj@kernel.org>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun,  5 Feb 2023 10:21:26 -0800, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> Some sentences in debugging.tex encloses 'rcutorture' with while some
> others don't.  Use \co{} consistently.

Ya, that's also the convention in defer/rcurelated.tex.

> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

> ---
>  debugging/debugging.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index 3ce74469..1903c5db 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -697,7 +697,7 @@ what it knows is almost always way more than your head can hold.
>  For this reason, high-quality test suites normally come with sophisticated
>  scripts to analyze the voluminous output.
>  But beware---scripts will only notice what you tell them to.
> -My rcutorture scripts are a case in point:
> +My \co{rcutorture} scripts are a case in point:
>  Early versions of those scripts were quite satisfied with a test run
>  in which RCU \IXpl{grace period} stalled indefinitely.
>  This of course resulted in the scripts being modified to detect RCU
> @@ -1252,14 +1252,14 @@ of time you spent testing.
>  Functional tests tend to be discrete.
>  
>  On the other hand, if my patch involved RCU, I would probably run
> -rcutorture, which is a kernel module that, strangely enough, tests RCU\@.
> +\co{rcutorture}, which is a kernel module that, strangely enough, tests RCU\@.
>  Unlike booting the kernel, where the appearance of a login prompt
> -signals the successful end of a discrete test, rcutorture will happily
> +signals the successful end of a discrete test, \co{rcutorture} will happily
>  continue torturing RCU until either the kernel crashes or until you
>  tell it to stop.
> -The duration of the rcutorture test is usually of more
> +The duration of the \co{rcutorture} test is usually of more
>  interest than the number of times you started and stopped it.
> -Therefore, rcutorture is an example of a continuous test, a category
> +Therefore, \co{rcutorture} is an example of a continuous test, a category
>  that includes many stress tests.
>  
>  Statistics for discrete tests are simpler and more familiar than those
> @@ -1845,7 +1845,7 @@ If the program is structured such that it is difficult or impossible
>  to apply much stress to a subsystem that is under suspicion,
>  a useful anti-heisenbug is a stress test that tests that subsystem in
>  isolation.
> -The Linux kernel's rcutorture module takes exactly this approach with RCU\@:
> +The Linux kernel's \co{rcutorture} module takes exactly this approach with RCU\@:
>  Applying more stress to RCU than is feasible in a production environment
>  increases the probability that RCU bugs will be found during testing
>  rather than in production.\footnote{
> @@ -1918,7 +1918,7 @@ delay might be counted as a near miss.\footnote{
>  \end{figure}
>  
>  For example, a low-probability bug in RCU priority boosting occurred
> -roughly once every hundred hours of focused rcutorture testing.
> +roughly once every hundred hours of focused \co{rcutorture} testing.
>  Because it would take almost 500 hours of failure-free testing to be
>  99\,\% certain that the bug's probability had been significantly reduced,
>  the \co{git bisect} process
