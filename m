Return-Path: <SRS0=N7nz=2V=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=69eO70i2xHkUpgu6eSZ8Z4GElwHPuhi4FNduCrQEQbA=;
        b=IfYIe2uzAwK+Vki5pxY86xsFZol8zkAZY5NO9l8BJofzhY2xa6a6ethbW//liJEDdd
         Ip2OE64ZZmtL6ZFYdST8idPavP450BVBnWudxXgZ1oY3hIusvo6OikJIXBh2gmsbKkMJ
         OBKhyD5zNFQy+oIf962WOAeW1my30SaeZ6wAwqXPXasefQsceCqDUIUqBnA//X1xXLfc
         qOcBXHkpB0NBBQg4cQxNvHDiULiaXn19w+YAi3mDFTYWZqBe3+sGIYVimKRA43IO+DlD
         bSUS9URFTcicgMGiClPZUMrK1UBr8XGwYWSKXOSmdUFZ99nngXYCowxErcGuPOxpDTZL
         9Qbg==
Subject: Re: [PATCH 0/3] Improve autodate.sh
References: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
 <20191231000627.GS13449@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <21f02b44-a925-f082-4cf9-af2a42786050@gmail.com>
Date: Wed, 1 Jan 2020 08:36:24 +0900
MIME-Version: 1.0
In-Reply-To: <20191231000627.GS13449@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 30 Dec 2019 16:06:27 -0800, Paul E. McKenney wrote:
> On Sun, Dec 29, 2019 at 07:21:42PM +0900, Akira Yokosawa wrote:
>> This patch set was inspired by your change log of commit 686915e83f79
>> ("utilities/autodate: Convert current tag to release/edition text")
>> saying:
>>
>>     This should really use a canned library to convert numerals to
>>     English-text ordinals, but none of the ones I found worked as advertised.
>>
>> My guess is the ones you found are assuming bash and don't work with
>> dash. You know, dash doesn't handle arrays.
> 
> It was instead that my versions of python didn't know about the
> advertised library, possibly because I didn't know to tell them.

Hm, installing python (or python3 nowadays?) packages can be tricky.
(system/user install, installing by pip/pip3 or apt ...)

> 
>> Patch #1 is my answer and delegates the handling of ordinals to
>> a LaTeX package "fmtcount".
> 
> But I like your approach better in any case, thank you!!!  ;-)
> 
>> Patch #2 is a minor update so that a repository with untracked files
>> is treated as clean.
> 
> My use case for wanting the current behavior is when I add a file,
> add references to it, but forget to do "git add".  The "(m)" is
> a hint that I forgot something.

Ah, current behavior does help such a situation!

> 
> But what is the countervailing use case? 

Not much of a use case, but for example, random experimental outputs
under CodeSamples/ not covered by .gitignore will generate the "(m)",
which looks irrelevant.

But my view point was of receiving side of your updates.
Now I know you've relied on the current behavior and changing it
should be regarded as a regression.

>                                           Maybe there is a way to
> solve both problems.

Let's keep the current behavior.

> 
>> Patch #3 expands the use of tag info and displays it on every page
>> at the bottom-right corner.
> 
> Nice!
> 
> I took #1 and #3, and pushed another patch that includes the most
> recent tag for non-release builds.

I thought full $description in non-release builds could be too long
for the footer area, but the position of the watermark in the preamble
specifies the center, and it looks reasonable. Thank you!

>                                           Let's talk about #2 -- perhaps
> I should take it as is, but that would require some other warning.
> 
> Thoughts?

As mentioned above, I'm OK with keeping the current behavior.
Adding some namespaces to .gitignore might be a better approach,
but it is not urgent at all.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> Akira Yokosawa (3):
>>   utilities/autodate: Use 'fmtcount' package for ordinals
>>   utilities/autodate: Ignore untracked files in 'git status'
>>   utilities/autodate: Put commit-id in footer by 'draftwatermark'
>>
>>  FAQ-BUILD.txt         |  6 ++++--
>>  perfbook.tex          |  9 +++++++++
>>  utilities/autodate.sh | 35 ++++++++++++-----------------------
>>  3 files changed, 25 insertions(+), 25 deletions(-)
>>
>> -- 
>> 2.17.1
>>

