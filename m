Return-Path: <SRS0=EmAl=2P=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jqSJbJT6HI57gfLY4Ghix6P1CABRT3pd5xCUvZ1HkrQ=;
        b=rj4/TBe4BLvnddkV2VqBNVQ86G8QaiLwbfQz4DsTH6ef6s6u9rwYV5R+dqZd2nZ2cn
         YmtWJB9dN8XjD2XwV6KoOibWCq6ja2OFHrDp6h48Ii20wdEf/xPWpESGVZPc2qGYSyW9
         XZ0mSmNI9kM66VvMwFBDwvhoEF5cBgOAC2cySI938kNw7fFSD0Mc22tiaPdov6jzlC2K
         jy0y1cicHvlZm6ZMGEIyygg9fbYo4DASM//gwNIAUHi/NeWmKFJpfNGQCf+6DJ4jru3h
         RTfh9a/+kTQBb/kMjDdeMkfpPQZL8GgclFwZMcTHFHPmqP5eE5KmEQwCsTIEf7W9rxuv
         2/6Q==
Subject: Re: [PATCH v2] utilities/autodate: Restore compatibility with bash
References: <f9c54c72-db80-f29e-76c5-2d36c02c183a@gmail.com>
 <b9691f42-5edb-d57f-3a11-d6ce7a7b930e@gmail.com>
 <20191224172432.GI13449@paulmck-ThinkPad-P72>
 <863f2ca9-5c1b-d4f9-ceca-94f92cdb7e74@gmail.com>
 <20191224231931.GK13449@paulmck-ThinkPad-P72>
 <20191225031820.GA15431@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <741a5587-1075-284d-827b-b1d03bff5568@gmail.com>
Date: Wed, 25 Dec 2019 20:29:39 +0900
MIME-Version: 1.0
In-Reply-To: <20191225031820.GA15431@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 24 Dec 2019 19:18:20 -0800, Paul E. McKenney wrote:
> On Tue, Dec 24, 2019 at 03:19:31PM -0800, Paul E. McKenney wrote:
>> On Wed, Dec 25, 2019 at 07:04:46AM +0900, Akira Yokosawa wrote:
>>> On Tue, 24 Dec 2019 09:24:32 -0800, Paul E. McKenney wrote:
>>>> On Mon, Dec 23, 2019 at 08:55:08PM +0900, Akira Yokosawa wrote:
>>>>> >From 43bf4cc57125d756ccd14b629692c4ecdb5c36dc Mon Sep 17 00:00:00 2001
>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>> Date: Mon, 23 Dec 2019 20:52:46 +0900
>>>>> Subject: [PATCH v2] utilities/autodate: Restore compatibility with bash
>>>>>
>>>>> Also improve uses of single quotes (without escaping) and
>>>>> double quotes (with escaping) in the script.
>>>>>
>>>>> Fixes: 650f763c31e8 ("utilities/autodate: Mark released versions")
>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>> ---
>>>>> Changes in v2:
>>>>>
>>>>>     o Modified title
>>>>>     o Tested with both "dash" and "bash" as /bin/sh
>>>>>
>>>>>         Thanks, Akira
>>>>
>>>> It does work here, queued and pushed, thank you!
>>>>
>>>> In other non-urgent news, arxiv does not like "@" in filenames (see below
>>>> for its complaints).  It -looks- like it is possible to make these instead
>>>> be "=" by changing the 's/:/@/g ;' instances in utilities/gen_snippet_d.pl
>>>> to 's/:/=/g ;', and then changing the pathnames containing "@" in the
>>>> various .tex files to "=".  
>>>
>>> I'm not sure if targets in Makefile can contain "=".
>>> Another approach would be to do the renames and substitutions on-the-fly
>>> in toarxiv.sh.  Thoughts?
>>
>> Good point, I will try on-the-fly substitutions.  Thank you, and best of
>> everything to you and yours over the holidays and the New Year!

Thank you!  And let me wish you all the best!

> 
> And that worked, thank you!  I have committed the changes with your
> Suggested-by.  And Arxiv is crunching away on it as well.  ;-)

Good to know!

Just wanted to make sure, does the uploaded autodate.tex have a proper
"Release" line?  I think it should because there has been no change in
its dependency since the tag "v2019.12.22a". But you might have touched
something by accident during the update of toarxiv.sh.

        Thanks, Akira
> 
> 							Thanx, Paul
> 

