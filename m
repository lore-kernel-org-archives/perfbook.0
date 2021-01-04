Return-Path: <SRS0=EPPH=GH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2B2FkcpcRi1s329Z2BEFQbAKk5U7Yxfte/+jV0trd68=;
        b=G0mxupjxT2EhKVkG3QZkUj06ONUwoO61CN4vnyDpWR1BZDtg0ZBktIojM5EnD4Gv5f
         EErwmLNN4e3HgO8UVNXVl9erw3WmQE73qS1Cmp4e5K/tdtzd0RJ1Whoj29/NV8wEDfsC
         n3gDrPE/t85xmGsSl7TLZOzhoEEUgGRi9mZcqgM8oz+t70j4DXrRUBGFczx07E+Fv6p0
         IVRBHKsIeB8283twBNFbAFT0v6mlNjCK7WMrNVd6hQcETC+rFJ/h++XWHXNrY1ZGPnXR
         8a5+rmlGMtls1LAY60a9FlsBGr3tHYebKYE73h5p0CPqX+ckHZ4xOANc1StENhD73N3U
         iCzw==
Subject: Re: Request for clarification on Alpha reordering
References: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
 <20210103035250.GE12032@paulmck-ThinkPad-P72>
 <7a4a8cbf-8828-6a2b-b45b-372eb84534ba@gmail.com>
 <20210103182429.GG12032@paulmck-ThinkPad-P72>
 <20210104003207.GA6191@paulmck-ThinkPad-P72>
 <3a34f99b-1b4d-7bfb-2a10-b29bac2a7c80@gmail.com>
 <20210104041200.GI12032@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e8e14d89-b390-ee23-8cd8-f8283ea11d7e@gmail.com>
Date: Mon, 4 Jan 2021 13:26:07 +0900
MIME-Version: 1.0
In-Reply-To: <20210104041200.GI12032@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

(Dropped CC: Daniel)
On Sun, 3 Jan 2021 20:12:00 -0800, Paul E. McKenney wrote:
> On Mon, Jan 04, 2021 at 12:56:25PM +0900, Akira Yokosawa wrote:
>> On Sun, 3 Jan 2021 16:32:07 -0800, Paul E. McKenney wrote:
>>> On Sun, Jan 03, 2021 at 10:24:29AM -0800, Paul E. McKenney wrote:
>>>> On Sun, Jan 03, 2021 at 01:12:40PM +0900, Akira Yokosawa wrote:
>> [...]
>>>>>
>>>>> Hi Paul,
>>>>>
>>>>> Off topic, but smp_read_barrier_depends() as a kernel API
>>>>> has been removed since Linux v5.9 [1].
>>>>> Now READ_ONCE() for Alpha uses mb() [2].
>>>>>
>>>>> You might want to reflect these changes in perfbook before the
>>>>> release of the Second Edition.
>>>>>
>>>>> [1]: merge commit https://git.kernel.org/linus/145ff1ec090d
>>>>>     ("Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux")
>>>>> [2]: commit https://git.kernel.org/linus/d64628588515
>>>>>     ("alpha: Override READ_ONCE() with barriered implementation")
>>>>
>>>> Good catch, thank you!  We will of course need to retain mention of
>>>> smp_read_barrier_depends() given that people will be using pre-v4.15
>>>> (to say nothing of pre-v5.9) kernels for some time, but the main code
>>>> does need to reflect the current state of the Linux kernel.
>>>>
>>>> Perhaps in the third edition we should drop any and all references
>>>> to DEC Alpha.  It is no longer in any way special, at least from the
>>>> perspective of core kernel code.  ;-)
>>>>
>>>> I suppose that the counter-argument is that non-Linux-kernel code might
>>>> still need to pay attention, so maybe DEC Alpha needs to stay until such
>>>> time as C/C++ handle address and data dependencies.  Worth some thought.
>>>
>>> In the meantime, how about like this?
>> Looks reasonable to me.
>> There is a footnote which now looks redundant.
>> Please find a patch below (on top your change) to remove it.
>>
>> With my patch (or similar) applied,
>>
>> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Applied and pushed both, thank you!

Paul, 

Could you please amend commit 3cccf2e94038 ("Cope with GhostScript
9.53.0 or later") to remove extra header lines:

    From d48155e896265c1a26985fe26f9bf8c5fbcfd22e Mon Sep 17 00:00:00 2001
    From: Akira Yokosawa <akiyks@gmail.com>
    Date: Mon, 4 Jan 2021 07:58:18 +0900
    Subject: [PATCH v2 -perfbook] Makefile: Cope with GhostScript 9.53.0 or later
    MIME-Version: 1.0
    Content-Type: text/plain; charset=UTF-8
    Content-Transfer-Encoding: 8bit

?

Looks like git-am does not automatically remove them when
"MIME-Version:" is in the header part.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>
>>> 							Thanx, Paul
[...]
