Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CfZ/lRuOK/xirENa9LXWja2l9DBqLCN0FBsr2R6K1+c=;
 b=UWpeH7qFlAkuLYSndezYKzDuDltHYP7+9ekyJRuyAw3YKGPL1ldV+B5pCsB89yZHQq
 X/1WEsXqIAfq3ksgMkdEDndmm4swUgIOmcY+7XqJrRsOSL2MLiM2OYQ+sG3mru9dwG2y
 BMjRXdpU2Zr3DNTsJef/qvU+Rs9tedoR1jNiItF0bW1CAHg0HRD8zCbVz5mdPzFNO8Fs
 0qRilus9CHsK/MyILTmVdjYXO+hM+lcddNGFBIgwuD+94+asoNZkUNmfbFF1ipg1+Fx6
 AmOfHxapcqEX+mfUP/26w1uy5vCOMF5/X9Icso4E7ivQFHcL/r/1MB7Y2AaJ6BkEDxtZ
 B44w==
Subject: Re: [PATCH] Convert code snippets to 'listing' env (SMPdesign,
 locking, defer)
References: <a83ce6f6-cb5f-ab17-b65f-b77203ed51db@gmail.com>
 <20171011225621.GT3521@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <73217c9c-6c30-1cf1-735d-0fa039dd0cc0@gmail.com>
Date: Thu, 12 Oct 2017 08:19:42 +0900
MIME-Version: 1.0
In-Reply-To: <20171011225621.GT3521@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/10/11 15:56:21 -0700, Paul E. McKenney wrote:
> On Thu, Oct 12, 2017 at 07:07:17AM +0900, Akira Yokosawa wrote:
>> >From 096ac85c06a27b8e8895e35bb58c634869a5a979 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 11 Oct 2017 23:04:11 +0900
>> Subject: [PATCH] Convert code snippets to 'listing' env (SMPdesign, locking, defer)
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Very good, queued, thank you!
> 
> One question...
> 
> o	Figure 6.22: "SEQ Pseudocode" is still in the old style.
> 	Ditto Figure 6.23: "SEQ Helper Pseudocode", Figure 6.26:
> 	"Partitioned Parallel Solver Pseudocode", and Figure 6.27:
> 	"Partitioned Parallel Helper Pseudocode".  Are these to be
> 	handled by a later commit, or is there something problematic
> 	about these figures?

Ah, I missed them. I'll take care of them in a later patch.

             Thanks, Akira
> 
> 							Thanx, Paul
> 
>> ---
>>  SMPdesign/SMPdesign.tex       | 72 +++++++++++++++++------------------
>>  SMPdesign/partexercises.tex   | 32 ++++++++--------
>>  defer/defer.tex               |  8 ++--
>>  defer/hazptr.tex              | 36 +++++++++---------
>>  defer/rcuapi.tex              | 16 ++++----
>>  defer/rcufundamental.tex      | 46 +++++++++++-----------
>>  defer/rcuusage.tex            | 76 ++++++++++++++++++-------------------
>>  defer/refcnt.tex              | 32 ++++++++--------
>>  defer/seqlock.tex             | 52 ++++++++++++-------------
>>  locking/locking-existence.tex | 20 +++++-----
>>  locking/locking.tex           | 88 +++++++++++++++++++++----------------------
>>  11 files changed, 239 insertions(+), 239 deletions(-)
>>
[...]

