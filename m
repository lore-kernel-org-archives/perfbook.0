Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:references:cc:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=xzxMFcy8/RXoA4j0fZhD8sdX3mWSNTf3VE1rXx0tbXg=;
 b=ZdIzMSbXn3ycC7VZDq+3paJXlACtZvDUxas1xl8BpJSXWEFIuJYSkpJY5xsJSweki6
 NBEGKjoVrxwWL/35Kz1Zj/5vi3GWppraQ4egHz0HhB07mFd3aBqNv9Ml2pThO6BA2mvR
 FeqspF8KLKcCxVYcd1vaybzQetG6CTEyrzyiK9PPe8asnp49RB2DrrbbGNsfCMbOrxaL
 c13yyMipq+sanQcxki5WIPxMqJwnIoeeig/a/SFnUb2z1UMGUa1vKtm/nTle4AX3mC0B
 WFZsGn2gl6mBvnE+wgU3vS5qRYuKkYUGw86cMIqduV1thxQPoEIfEJUOl/Yy8QqMp82D
 3axQ==
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
 <20170104014004.GG3742@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Use \tco{} for API names inside of tables
Message-ID: <97f7304e-d989-1b21-0fed-465d540dd66d@gmail.com>
Date: Wed, 4 Jan 2017 20:35:25 +0900
MIME-Version: 1.0
In-Reply-To: <20170104014004.GG3742@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/01/03 17:40:04 -0800, Paul E. McKenney wrote:
> On Wed, Jan 04, 2017 at 10:15:40AM +0900, Akira Yokosawa wrote:
>> >From d07bf0df57c597c22de9a7c159f10b0247cea8c2 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 4 Jan 2017 08:51:15 +0900
>> Subject: [PATCH 00/13] Remove \co{} commands in tables
>>
>> \co{} command confuses column width estimation of tabular environment.
>> By removing \co{} commands in tables, bogus "~"s for manual width
>> adjustment can be removed.
>>
>> Patch 1 introduces an alternative command \tco{} to be used in tables.
>> Patches 2--8 remove \co{} commands by using \tco{} or removing unnecessary
>> commands.
>> Patch 9 removes another "~" and uses \vspace{} instead.
>> Patches 10--13 do additional font tweaks. It looks better for me if
>> headers of tables such as "Thread 1" and "CPU 1" are typeset in normal font
>> of the text (Times Roman). Patch 13, which tweaks font of non-code words in
>> table, may be an excessive tweak. Whether or not to apply it is up to the
>> editor.
> 
> I queued and pushed these, thank you!
> 
> I am a little concerned about the added "\_" instances that show up
> in some of the tables, though.  Does it work to use \tco{} or similar
> to avoid these?  My concern is frustration for people searching the
> .tex source for tables containing (say) smp_wmb().

I see your point.  Using \tco{} for API names should work.
A patch set follows.

In preparing this, I also found a long-lived typo in Table "Memory Barrier
Example 3". Patch 2 fixes it.

> 
> 							Thanx, Paul
> 
[snip]

--
Akira Yokosawa (2):
  Use \tco{} for API names inside of tables
  Fix typo smb_wmb() -> smp_wmb()

 advsync/memorybarriers.tex           | 20 ++++++++++----------
 appendix/whymb/whymemorybarriers.tex | 14 +++++++-------
 2 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.7.4

