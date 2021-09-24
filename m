Return-Path: <SRS0=DhWa=OO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QxNSqNRhWhf+vM5Nbu2avmzzCdzqZhCZHWYeJSPWuR8=;
        b=R1NUCoqkoEXRZJXr9CZXP6dFsFGx7tzhAzj6w13m5IjMgRcSGZkbLoOxW8Qwspz7rv
         d898BtNkgTtFA+7Kmvloch5zUnC2zo/tqg9uS4NyUSkath0gPba1dW8QnjPdVJNakt3k
         N2Nv6wWPEV0ibI+2dA7mj9l4b+EIqGZLoGyRrPjdiShdi5WQEcIOojybzli/JGYckzWB
         xL8jeIk8E4L14+A6eHezSfBqCycv4oa9VfcViDvEVLajhM12Tb827BhslaAhTfY+blUF
         0NMR/B38Tz+noSGZJT1hYMwNkmcVG1QJ6NdrTM6BnzznBpgETPUurdQoYq1ltQyY1ktD
         ntkA==
Subject: Re: [PATCH -perfbook] defer: Make RCUspacetime.svg compatible with
 Inkscape 1.0 and later
References: <a11543f8-194b-2363-dd36-141044bce89b@gmail.com>
 <d28da94e-3e54-e264-5b81-01c1636dbb9f@gmail.com>
 <20210923144150.GF880162@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <957e369c-9fb1-f615-9b62-c1245d227548@gmail.com>
Date: Fri, 24 Sep 2021 09:25:31 +0900
MIME-Version: 1.0
In-Reply-To: <20210923144150.GF880162@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 23 Sep 2021 07:41:50 -0700, Paul E. McKenney wrote:
> On Thu, Sep 23, 2021 at 06:44:33PM +0900, Akira Yokosawa wrote:
>> On Thu, 23 Sep 2021 12:08:35 +0900, Akira Yokosawa wrote:
>>> Rotated labels on the "Time" axis of Figure 9.27 are misplaced when
>>> built on Fedora 34 (Inkscape 1.1) and Ubuntu 21.04 (Inkscape 1.0.2).
>>
>> FWIW, here is a link to a screenshot with misplaced labels:
>>
>>     https://fars.ee/AMQ2.png
> 
> Ouch!!!  And good catch!
> 
>>         Thanks, Akira
>>
>>>
>>> Update the svg file with the one tweaked by Inkscape 1.1.
>>>
>>> It is backward-compatible with Inkscape versions 0.92.3 (Ubuntu 18.04),
>>> 0.92.5 (Ubuntu 20.04), and 1.0.2 (Ubuntu 21.04).
>>>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Queued and pushed, thank you!
> 
> So I should install an Inkscape 1.1 or later?

I think so.

Otherwise, it would be hard for you to edit the updated .svg file.
You should be able to install snap version of inkscape on Ubuntu 20.04.
However, it has some restrictions mentioned at:

    https://inkscape.org/release/inkscape-1.0/gnulinux/snap/dl/

Especially, the one at the bottom:

>   fonts that you have installed globally on your system are not
>   available (workaround: copy the font files into ~/.local/share/fonts)

worries me.

Setting up a Fedora VM might be easier for you.

But as far as you don't rotate strings, Inkscape < 1.0 should be
good enough.

I can help you fix any rotated string in new .svg files.

        Thanks, Akira

PS:

Upcoming ghostscript 9.55.0 (now in rc1 phase) will break a2ping again!
I'm preparing a patch set to abandon a2ping for good.

> 
> 							Thanx, Paul
> 
>>> ---
>>> Hi Paul,
>>>
>>> Parameters for string rotation from Inkscape 0.92.5 are not handled
>>> as expected by Inkscape >= 1.0.
>>>
>>> I've not seen any such breakage in .svg files made by Inkscape 0.92.3
>>> (Ubuntu 18.04).
>>> So this issue might be local to Ubuntu 20.04, but I'm not sure.
>>>
>>> Also, it looks like fixsvgfonts.sh and fixsvgfonts-urwps.sh need some
>>> update to catch additional patterns of font specification strings.
>>>
>>> I'll post a follow-up patch to update them.
>>>
>>>         Thanks, Akira
>>> --
>> [...]
