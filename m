Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=qdk+PChavc9n/uvasWGbJ/wnif24uzJT7zz3ASc8Heg=;
 b=Mts1w5dsBxydKcPUlgTvu9t5+zJtVW2YNkwmAMI3EzvS4KOh33ELzint0jgjnw0VPQ
 qTvR/bFxcFIV3iSS+mscXlXD8twUBQN4vLaQsE6u9aZxfZ0c6WCk2pjvvlsPZDYoRpwt
 j5+LeX5Iad/Q5BdUfYblxh+r+MbWozir2DpXFfUgCo/4WoHB4ynd4+ARDlnvFqKxagZb
 xpLjDjg1hSEH0A2cFuQSPlGMzlJg+/yyk8pR+CAUhbQ9O3zpzTDOxXsV21v12FBLb+A6
 hyR7xpQfq724XuMHl4trWdowcTA8dXTA2FSIqZyBXiQe6A7CjKyeaaCK4zk7wOUAJ5n3
 XfKg==
Subject: Re: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
References: <b76692c9-330c-2531-67dd-b7f445644227@gmail.com>
 <017bdee4-c318-f7f5-95bf-b213b4df86e5@gmail.com>
 <20160908111622.GM3663@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ed8f9798-0ff5-7d96-ef30-b2157af7c4fd@gmail.com>
Date: Sat, 10 Sep 2016 09:19:32 +0900
MIME-Version: 1.0
In-Reply-To: <20160908111622.GM3663@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/09/08 04:16:22 -0700, Paul E. McKenney wrote:
> On Thu, Sep 08, 2016 at 12:58:53AM +0900, Akira Yokosawa wrote:
>> On 2016/09/08 0:47, Akira Yokosawa wrote:
>>> >From 480c37c4749ae4957791636e84e77566265613c2 Mon Sep 17 00:00:00 2001
>>> From: Akira Yokosawa <akiyks@gmail.com>
>>> Date: Thu, 8 Sep 2016 00:20:29 +0900
>>> Subject: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
>>>
>>> This is a trial commit to avoid the side-effect of the "verbbox"
>>> environment, i.e., when it is used just after a section heading,
>>> the following paragraph loses implicit non-indentation.
>>>
>>> This commit moves such a "verbbox" environment *before* the section
>>> heading.
>>>
>>> There are also cases where two "verbbox" environments are placed just
>>> after section headings. To accommodate such cases, one of such
>>> "verbbox" need to be replaced with "myverbbox" environment to give
>>> another temporary verbatimbox content holder.
>>>
>>> This commit includes an example of such a case.
>>>
>>> Note that the "myverbbox" environment is provided in recent versions
>>> of the "verbatimbox" package, namely after v3.0.
>>>
>>> If you have older versions of "verbatimbox" package, you need to
>>> update. Also the newer one requires the "readarray" package.
>>>
>>> Please make sure you have those required packages.
>>>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>> ---
>>>  defer/toyrcu.tex | 31 +++++++++++++++++--------------
>>>  1 file changed, 17 insertions(+), 14 deletions(-)
>>>
>>
>> Hi Paul,
>>
>> So, this is what occurred to me.
>> The main idea is to move "verbbox" environment before the section heading.
>> This patch contains only a small samples.
>> Does this level of modification acceptable in your viewpoint?
>>
>> One concern is the requirement of fairly new "verbatimbox" environment.
>> On Ubuntu 12.04, the one installed in texlive is too old.
>> On Ubuntu 14.04 and 16.04, it contains newer versions.
> 
> I am currently running Ubuntu 14.04, so it would work.  But is there
> anything that could be done to make "verbbox" avoid causing this change?
> 

So I tried several modification of verbatimbox.sty to do so.
But what I could do was to add a variant of "verbbox" named "verbboxh"
which passes "afterheading"-ness to the next paragraph.

The way to do this can be found at
http://tex.stackexchange.com/questions/23265/suppressing-indentation-of-the-next-paragraph

But when I made the same change to "verbbox" without \@afterindentfalse to
make it "afterheading"-ness aware, the resulting pdf looked weird with irregular
vertical spacing before section headings.

It's far beyond my capability to figure out how to fix this.

Using the variant "verbboxh" in the LaTeX sources would be essentially the
same as adding explicit \noindent's from a maintainer's viewpoint.

So moving the position of "verbbox" environment seems a good compromise for now.
And by doing so, the position would be a good reminder of the side-effect.

What do you think?

                                         Thanks, Akira


> 							Thanx, Paul
> 
> 

