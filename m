Return-Path: <SRS0=EPPH=GH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DwmAH069IFJ6mN9410Up2MLr9tX7XdcqTOE/vLjGQK4=;
        b=o8bb0u/K0O/OVoMROIeMEKw9caAogGs0X/oVzSjnCklqG3BsVQikK9/newToUYd2yu
         DSId5tpBrX7VmjZasVdDwRTuY7s/edEL3OZNQzdV+VzbFz8Fg0lP4XjpQIbU3FWN9RJa
         34C8IDDJflWlCAgwOFt2RWLseJm82YkuNicuZRuN1SIUZmk/4npnXa0UzY+bZqinY+i0
         x8WWRTdpvT6F0aIQVqf2GEzutka5IazazOSf9gpxDqvv9qxRz36PK2S5hTJ9czEFFg/Q
         ew7z93daQ1yuYupOC59PxOuYDlVa++VjtUGKeWkbGIp81p583Hp3AnBcXPiFt24H/EI8
         cM2Q==
Subject: Re: Request for clarification on Alpha reordering
References: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
 <20210103035250.GE12032@paulmck-ThinkPad-P72>
 <7a4a8cbf-8828-6a2b-b45b-372eb84534ba@gmail.com>
 <20210103182429.GG12032@paulmck-ThinkPad-P72>
 <20210104003207.GA6191@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3a34f99b-1b4d-7bfb-2a10-b29bac2a7c80@gmail.com>
Date: Mon, 4 Jan 2021 12:56:25 +0900
MIME-Version: 1.0
In-Reply-To: <20210104003207.GA6191@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Daniel Nitzan <danny.nitzan@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 3 Jan 2021 16:32:07 -0800, Paul E. McKenney wrote:
> On Sun, Jan 03, 2021 at 10:24:29AM -0800, Paul E. McKenney wrote:
>> On Sun, Jan 03, 2021 at 01:12:40PM +0900, Akira Yokosawa wrote:
[...]
>>>
>>> Hi Paul,
>>>
>>> Off topic, but smp_read_barrier_depends() as a kernel API
>>> has been removed since Linux v5.9 [1].
>>> Now READ_ONCE() for Alpha uses mb() [2].
>>>
>>> You might want to reflect these changes in perfbook before the
>>> release of the Second Edition.
>>>
>>> [1]: merge commit https://git.kernel.org/linus/145ff1ec090d
>>>     ("Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux")
>>> [2]: commit https://git.kernel.org/linus/d64628588515
>>>     ("alpha: Override READ_ONCE() with barriered implementation")
>>
>> Good catch, thank you!  We will of course need to retain mention of
>> smp_read_barrier_depends() given that people will be using pre-v4.15
>> (to say nothing of pre-v5.9) kernels for some time, but the main code
>> does need to reflect the current state of the Linux kernel.
>>
>> Perhaps in the third edition we should drop any and all references
>> to DEC Alpha.  It is no longer in any way special, at least from the
>> perspective of core kernel code.  ;-)
>>
>> I suppose that the counter-argument is that non-Linux-kernel code might
>> still need to pay attention, so maybe DEC Alpha needs to stay until such
>> time as C/C++ handle address and data dependencies.  Worth some thought.
> 
> In the meantime, how about like this?
Looks reasonable to me.
There is a footnote which now looks redundant.
Please find a patch below (on top your change) to remove it.

With my patch (or similar) applied,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

> 
> 							Thanx, Paul
[...]

------------------------------------------------------------------------

commit 7069136668105b6d4fd2d0c2ea4951d83f2c5424
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Mon Jan 4 12:25:22 2021 +0900

    memorder: Remove redundant footnote
    
    Now that it becomes contextually obvious that this paragraph is
    talking on the pre-v4.15 READ_ONCE() of Alpha, the footnote can be
    removed.
    
    Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 28c54967..a907025e 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3940,10 +3940,7 @@ This \co{smp_wmb()} on \clnref{wmb} of this listing
 guarantees that the element initialization
 in \clnrefrange{init:b}{init:e} is executed before the element is added to the
 list on \clnref{add}, so that the lock-free search will work correctly.
-That is, it makes this guarantee on all CPUs {\em except} Alpha.\footnote{
-	But Linux kernel versions v4.15 and later cause \co{READ_ONCE()}
-	to emit a memory barrier on Alpha, so this discussion applies
-	only to older versions of the Linux kernel.}
+That is, it makes this guarantee on all CPUs {\em except} Alpha.
 \end{fcvref}
 
 \begin{listing}[tbp]

