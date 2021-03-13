Return-Path: <SRS0=jsSa=IL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BphTDwR8onxzHVHHlaaTsBNXIO1VpFjp4I+mDDoekUo=;
        b=Bt1RzjE+85+wQ9imxtGb/o5hwzbTfalapRzjhVDmoyF7S/mtonpvsnIzFgmnqzKQF7
         L3gB59dhcafgPzMaQJCopLcxk0ZyLlcCXousPp0Xq14cGltl7FG3G85R4rwnz8AUOGPm
         n8444MgxRhNZr1+BLWZ1tYbYpPB6TOk1GXxgMxcfCiBgd2QyeATneNngiTG3EA3+TAaW
         Rf8ZZsqSSBQVCofjRvUa08VHgk0BQoPowymrC4JXYISBPifwn+1tVskADM/Y/rlidToL
         auq1DaHitAf6VZZdNGSW3UBAUNO8/3o5+6zm2Hfkx9Pyl41yx1O65z6SGtEUb2u/Qkfc
         84Ag==
Subject: Re: [PATCH -perfbook] summary: Misc. fixes/tweaks
References: <3433dd91-c602-528f-7297-ed04609df447@gmail.com>
 <0ecabafc-a09d-48fb-fc75-c71f64725727@gmail.com>
 <20210313053826.GJ2696@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3fa5a137-9b9d-cff3-a0cc-37306146ca49@gmail.com>
Date: Sun, 14 Mar 2021 00:32:14 +0900
MIME-Version: 1.0
In-Reply-To: <20210313053826.GJ2696@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 12 Mar 2021 21:38:26 -0800, Paul E. McKenney wrote:
> On Sat, Mar 13, 2021 at 12:35:50PM +0900, Akira Yokosawa wrote:
[...]
> 
> I queued and pushed your fixes above, thank you!
> 
> And I will be doing another rc this weekend in order to give us both
> some time for proofreading.  I intend to revisit the changes that I
> made, and I of course welcome any and all additional bug reports and
> fixes.

There can be conflicts, but you are good at resolving them.
Expect a couple of patches soon.

> 
>> A much natural option would be to add a couple of paragraphs in front
>> of the figure so that at least a few sentences make the following
>> page in 1c builds.
> 
> Your concern is the large quantities of vertical whitespace on page
> 569 of perfbook-1c.pdf?

Well, they don't look that ugly.  There are much wider gaps elsewhere
near section epigraphs.

My main concern is the "H" option, which is considered as a last resort.
It will likely bite you when you add/remove some text around it.

>                          I could imagine expanding on the changes
> in tooling from 2003 to 2006 that Linus alluded to.  I could also
> imagine filling in on my attempts to get the book going from late
> 2004 to 2006.

That would eliminate the adhoc code for 1c layouts.
Float objects near the end of a document/chapter are sometimes
quite tricky.

        Thanks, Akira
> 
> Or am I missing your point?
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>  
>>>  And this book is also for everyone else who would like to add low-level
>>>  concurrency to their skillset.
>>>
