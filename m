Return-Path: <SRS0=56sw=FH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CV1Oq2mNE3UPy4pJ3Nk+sY/NmAD69FsKctf39mFDVC8=;
        b=Zgi+r5EempzEXsR/okdtVLc0WleOQCciHWHjbvB4L98/j9U6SOxhWbL0lQtnAnhYdo
         v0kfg5KCbYIqiYcc4f1URPEMwinudTmZfvq2HRs9IDFTFEq+zDKj7XnJPlajn7gsQnQu
         imSRWKis2J3S94SW6bDcCK7gQsjlbOJkgFUVUx4uKV9uW+SXu8dqt05ZX4SKbaCD4PI9
         hAY0cXRFh9vnFzBRn4psQQoHyhyjmdx60VMPgJI7+w6l7ZbTzeuf27DJrdvtTsf9uIeg
         ZkcgIhfgGZMrwhHLDwNbHPPUevJ/0NYsMQFgde91FmJM3K+MLQj4P1NlanOYjOmoe1Rb
         39GQ==
Subject: Re: [PATCH -perfbook] whymb: Fix description of compiler mischief
References: <99ea974f-8788-c2e5-5544-e7e708ad2553@gmail.com>
 <20201203165143.GX1437@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4b773dda-d083-702a-9519-f8fc76eadac1@gmail.com>
Date: Fri, 4 Dec 2020 07:42:29 +0900
MIME-Version: 1.0
In-Reply-To: <20201203165143.GX1437@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: Motohiro Kanda <kanda.motohiro@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 3 Dec 2020 08:51:43 -0800, Paul E. McKenney wrote:
> On Wed, Dec 02, 2020 at 11:50:27PM +0900, Akira Yokosawa wrote:
>> >From 89ab8426f9821b6a8bf86e9d4f7eb596e0cfed73 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 2 Dec 2020 07:35:08 +0900
>> Subject: [PATCH -perfbook] whymb: Fix description of compiler mischief
>>
>> In this code snippet, the assertion can not fire due to different
>> reasons.
>> When bar() observes b == 1, the smp_mb() assures a == 1.
>> When bar() observes b == 0, the while loop will loop forever and
>> the assertion can't be reached.
>>
>> This was pointed out by Motohiro Kanda in his Japanese translation
>> of perfbook [1].
>>
>> [1]: https://sites.google.com/site/kandamotohiro/perfbook-d/perfbookappendixf10
>>
>> Cc: Motohiro Kanda <kanda.motohiro@gmail.com>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> I took this patch as is, but added a patch on top that (hopefully)
> does a better job of explaining the situation.  Thank you both!!!

Ah, this was your original intention of this Quick Quiz.

Yes, this explains the situation much better.

I did thought about dropping the smp_mb() in the snippet at first,
but that would require me to do a larger rewrite of the answer.
Instead, I submitted the minimal patch to attract your attention. ;-)

> 
> Would it also help to add a reference to the discussion of control
> dependencies? 

Yes, I think so.
Section 15.3.3 or Section 15.3 as a whole would be a good reference.

        Thanks, Akira


>                The straightforward answer given that information is
> "control dependencies do not order later loads".
> 
> Motohiro, would you be OK with my mentioning your translation in the
> next set of release notes for perfbook?  Either way, I much appreciate
> your doing this work!
> 
> 							Thanx, Paul
> 
