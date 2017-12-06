Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vyoMrqxsLZGMjF4wPcjT1xFd8qBoL9o31UYrROMx/6U=;
 b=NXHhGnDABuKsL3CUdrO7kA/5Muf1o4LGXLxlkpNao4rh06C2sldql9lebCu55JNGqx
 umo7xLdvWURJtGynDAInS4iqomyLWXomOCX4WEBKb32tjkapaGr3b3w0+/U0426nAYMn
 +x/io86FuKqIna9v6MXHdDAn3N37+TEY95NgS09pXNxpRvQ+xUCvyK4A/FI2fW0azIW9
 dgUblIjkWWyHZnYASRF/TDvTBQfuwuOoGkO4ySMyYHXNw8PpT7EVaMYaq65XbCaBMIBO
 WartqDuyjh5rKKpxLodPwUEi2usJ+L1Wll98gOyU4CgnkFdFDaP8vK/5V/557sn36nkJ
 tcHA==
Subject: Re: [PATCH 0/2] future: Update Locking and HTM comparison tables
References: <49209cfd-5494-fc54-ba4b-f8389ba4aed7@gmail.com>
 <20171206161159.GX7829@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6fe9f2b7-0a5e-cecc-a8e7-161a3b7af7c7@gmail.com>
Date: Thu, 7 Dec 2017 07:16:02 +0900
MIME-Version: 1.0
In-Reply-To: <20171206161159.GX7829@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/12/06 08:11:59 -0800, Paul E. McKenney wrote:
> On Thu, Dec 07, 2017 at 12:00:02AM +0900, Akira Yokosawa wrote:
>> >From d6497dadbc973d7d94591f48730c4c0ce1c129a8 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 6 Dec 2017 23:40:04 +0900
>> Subject: [PATCH 0/2] future: Update Locking and HTM comparison tables
>>
>> Hi Paul,
>>
>> I have tackled the remaining two tables of old style in Section 17.3.
>> "Advantage", "Disadvantage", and "Strong Disadvantage" can be indicated
>> by background colors, and their structures can be simplified.
>> This scheme is inspired by Table 12.4, with using lower saturation
>> colors.
>>
>> Patch #1 modifies the tables.
>> Patch #2 adds a merged table of the two as a sidewaystable.
>>
>> Background colors are chosen so that they can be distinguished
>> when they are printed in grayscale.
>>
>> Thoughts?
> 
> Very nice!!!  I very much like the use of colors instead of symbols,
> and I say that as someone who is red-green colorblind.  ;-)
> 
> I queued both commits and added the commit below.  If you are OK with
> the below change, I will push all three.  If not, please let me know
> what needs to change.

Sounds nice!
Such a casual expression never occurs to me.

Acked-by: Akira Yokosawa <akiyks@gmail.com>

But I found another typo in the table. (Privitization)
I'm sending v2 of the patch set containing the fix.
Please apply it instead.

       Thanks, Akira
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 76dacd546e9e1ad1153ef5b3ef6ad0dfd9985246
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Wed Dec 6 08:07:10 2017 -0800
> 
>     future/htm: Reword sentence referencing the new Table 17.3
>     
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/future/htm.tex b/future/htm.tex
> index 6667cd0ce8f0..908166bc0768 100644
> --- a/future/htm.tex
> +++ b/future/htm.tex
> @@ -920,9 +920,11 @@ A summary of the differences between the two tables is as follows:
>  
>  \input{future/HTMtableFull}
>  
> -For those who want to see the comparison at one view,
> +For those with good eyesight,
>  Table~\ref{tab:future:Comparison of Locking (Plain and Augmented) and HTM}
> -shows the merged comparison.
> +combines
> +Tables~\ref{tab:future:Comparison of Locking and HTM}
> +and~\ref{tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}.
>  
>  Of course, it is also possible to augment HTM,
>  as discussed in the next section.
> 
> 

