Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=mkTMSibPUD5BNomm04PbqahHpyl09YMW4/VnuKTO6ec=;
 b=VJwIwafHKKXXc4HM/EiMIpkVsk6U5IreA/ThSkIjBD4cjv96AhSmPxN52FW4YlRfPI
 oocn7MXWUiDpLhlOI0YD2E5wskRKIAT5L16waKj2IB9UtFhaGseXgZGpVHAA+P1EN9Kl
 2YyMEoakEX1flXSst4wIqg0OfOE+WXXeX2DWLIUb3mF+3WqPuLNVm9ohrn8FjwcqQksp
 L4lQy02j13oHjQhUKj3c82fRGqJENP5je6skcixSYKrqSMruhs4ArMJ2n0PDF/Lof+D1
 d99f2SlNp6lYEitGH4frEtVTYwMloxQgAW+lXYE5QyDeakN0N6BccKS6sq7HBUha25w4
 N4Jw==
Subject: Re: [PATCH] qqz: Add another hyperlink to black box in QQA
References: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
 <20160717215900.GD7094@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <731d8ed0-deae-e159-a889-ba38822011e8@gmail.com>
Date: Mon, 18 Jul 2016 07:54:27 +0900
MIME-Version: 1.0
In-Reply-To: <20160717215900.GD7094@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/17 14:59:00 -0700, Paul E. McKenney wrote:
> On Sun, Jul 17, 2016 at 02:50:04PM +0900, Akira Yokosawa wrote:
>> From 2a74b30f0a1d036e45c6aa5ef431034c23f790db Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Tue, 12 Jul 2016 20:28:08 +0900
>> Subject: [PATCH] qqz: Add another hyperlink to black box in QQA
>>
>> This commit adds another cross-link to the black boxes in QQA.
>> I think this change would meet readers' expectation.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>
> I agree!  For reasons that are not clear to me, I had to hand-apply
> this patch.  Might have been a white-space issue, which I did not
> think to check for...
>
> Please take a look at the patch below to make sure that I did it
> correctly.

Yes, you did it right. I'm wondering what was wrong on my side.

>
> Also, this suggests a possibility:  In the quick-quiz answer, suppose
> that the heading and the black box link (as they do now) to the beginning
> of the quick-quiz question, but that the white box links to the end
> (or just after the end) of the quick-quiz question.  That way, the
> reader could choose the return point.
>
> Would that make sense?

Well, yes if readers expect the behavior.
But for long answers, there are cases where you can choose only the white
boxes in your view. I'm hesitating because of your reaction to the first
attempt  the other day.

Anyway, I'm going to submit a patch for you to try.

Also we'd also need to update the explanation in the answer of Quick Quiz 1.3
if we actually do the change.

>
> 							Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 8afdb9c1a55c7cf2300e6812cff58dd0fda4d585
> Author: Akira Yokosawa <akiyks@gmail.com>
> Date:   Sun Jul 17 14:54:03 2016 -0700
>
>     qqz: Add another hyperlink to black box in QQA
>
>     This commit adds a hyperlink from the black box in the quick-quiz
>     answer to the beginning of the corresponding quick-quiz question.
>
>     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>
> diff --git a/qqz.sty b/qqz.sty
> index 12dc85e30116..0c97df92cb50 100644
> --- a/qqz.sty
> +++ b/qqz.sty
> @@ -78,7 +78,8 @@
>  	\noindent
>  	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} #1 ~ \\ }
>
> -\newcommand{\QuickA}[1]{\rule{7pt}{7pt}
> +\newcommand{\QuickA}[1]{%
> +	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
>  	\par\vspace{0.8\baselineskip}
>  	\noindent\textbf{Answer:} \\ }
>
>
>

