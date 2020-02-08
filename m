Return-Path: <SRS0=RuZN=34=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vGVeZq0wi5rbt+wBTGOtJ2UiH1k+iqDl38R2osMMuOM=;
        b=EzPgkgrGeZe9F5NBym5pmQoRiI9vPnLojzqTejKkmZTjKPxrLkFw6PkcT44oroJQak
         OtDApWPGS9vVm5B0jyBnTAVuPp3DNo4UGZ99ISen9kmhBVM0sEnlDIgx6yuPtnyPsH2Y
         I97jXsH2EXgIoTERSl1r1S1tvFsrZ1r5fNGbEvUs4/GCHjhfjwa+bzp6lT+HaE9ySoI0
         gLlCAgxOz4lXh4dKCmwlDC/SU7Th5pAzDshmcLYyUCHYasxR5MP0NCoW+dbobqtUesLR
         haJvk+yd7NSQ0AD+tuIk1Yb/OveBtlr+4GHYADrB0OlCPWAvgxP1Esw/R+lSk1A3v4Ya
         opkA==
Subject: Re: [PATCH] SMPdesign: Fix meaningless consecutive blank pages
References: <74a6c257-cf2a-315d-202a-a109c874e843@gmail.com>
 <20200208130358.GR2935@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2e7e0662-d12d-2d54-c504-e68e5fee5ade@gmail.com>
Date: Sat, 8 Feb 2020 23:44:13 +0900
MIME-Version: 1.0
In-Reply-To: <20200208130358.GR2935@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 8 Feb 2020 05:03:58 -0800, Paul E. McKenney wrote:
> On Sat, Feb 08, 2020 at 09:03:10PM +0900, Akira Yokosawa wrote:
>> >From 66df1c9aaaefb2ef5ccfd0c23837b33218a24f30 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sat, 8 Feb 2020 08:29:08 +0900
>> Subject: [PATCH] SMPdesign: Fix meaningless consecutive blank pages
>>
>> In the introduction of Dining Philosophers, there is two-page
>> "think about it" gap before presenting an answer.
>>
>> Let's see what we need for print editions.
>>
>> When the question is on an odd page, the answer can be on the next page
>> (the other side of the question's page).
>> When the question is on an even page, the answer should be on the
>> next even page to prevent it from being spotted too early.
>>
>> For electronic editions, there needs to be a gap of at least one
>> page regardless of the question's position.
>>
>> As \cleardoublepage changes its behavior depending on whether it is
>> on an odd page (one blank page) or on an even page (nothing), it
>> can not cover the requirement for electronic editions.
>>
>> For our purpose, the sequence of \clearpage, "((Intentional blank page)",
>> and another \clearpage should suffice.
>>
>> Reported-by: Paul E. McKenney <paulmck@kernel.org>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> I have queued this, thank you!
> 
> It works as desired with the current setup because the discussion and the
> reveal both end up on even pages.  You can check this using the "evince"
> PDF viewer by putting it into two-page mode (apologies for not saying
> so earlier, but I just now remembered myself).
> 
> Wasting the single page isn't a disaster, as you say, but could the
> trick shown here avoid even that?
> 
> https://tex.stackexchange.com/questions/6143/if-then-else-for-odd-page-even-page
> 
> I tried this (but leaving out the recommended \strictpagecheck, which
> might mean that there could be errors when this occurs near the beginning
> of a page?) and it seems to handle both cases.  Please see below for a
> patchlet on top of your patch.

I've not tested it yet, but I think this trick should be enabled only
for print editions.
I'm wondering what is the right option to distinguish print editions
from electronic editions.

One way would be to update autodate.sh and define a boolean as true
in autodate.tex when you have a tag of "Edition.nP".

Does this sound reasonable to you?

        Thanks, Akira

> 
> If this really works, could you please fold it into your patch with any
> needed adjustments?  If it is broken in some way, well, I do have your
> existing patch which does represent a much-appreciated improvement!
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
> index 4ceaefe..82de2b9 100644
> --- a/SMPdesign/partexercises.tex
> +++ b/SMPdesign/partexercises.tex
> @@ -84,6 +84,8 @@ there will be five forks available to four philosophers.
>  At least one of these four will have two forks, and will thus be able
>  to eat.
>  
> +\clearpage  //  Comment out to see the other option.  And move it around.
> +
>  This general technique of numbering resources and acquiring them in
>  numerical order is heavily used as a deadlock-prevention technique.
>  However, it is easy to imagine a sequence of events that will result
> @@ -107,8 +109,12 @@ philosophers to eat concurrently.
>  Please think about ways of partitioning the Dining Philosophers Problem
>  before reading further.
>  
> +\checkoddpage
> +\ifoddpage
> +\else
>  \clearpage
>  (Intentional blank page)
> +\fi
>  \clearpage
>  
>  \begin{figure}[tb]
> 
