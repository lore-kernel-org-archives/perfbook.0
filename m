Return-Path: <SRS0=TOrF=X5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M7poifXbm9m7+gZQxos75M7TXxegLrmaDG8TSCB8gUQ=;
        b=IoVU/+jTJADo6g01pjecPSwq7zBMPrmfXNc79zhddP/DTyZsrbaRLoEA1hpv5nUUw1
         ceXWO0RYSgU3MLXqrepwZF5VyQ2Bi/e8SKhsOhkQTKRdT0WjgHwNbH2n0Vt0YNJs9jin
         QUEITqWCC5d/0uXLs4p17q7IO2fp1mz/AqtdTY8J3FoTcSiyuzg/tsuOwYTqh64NAd2x
         +gtRKK+7/bY+CNf6DwWBMK9SfgiP8ciVTresvUe0uc5XVs6YfYX4LZ0Gyi/ojldyP7m4
         2kQPi6IBWyBQDQpEqioid/b9QWow93IlfvW0VVlgJ2ICQhuOSL/CWBJ+aLlxgr7ej0G/
         lkJQ==
Subject: Re: [PATCH 0/6] ppcmem: Apply new scheme of code snippets
References: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
 <20191003025009.GK2689@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7156c2ef-0ae0-cb5c-96e5-776563b48c6c@gmail.com>
Date: Fri, 4 Oct 2019 10:36:00 +0900
MIME-Version: 1.0
In-Reply-To: <20191003025009.GK2689@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 2 Oct 2019 19:50:09 -0700, Paul E. McKenney wrote:
> On Sat, Sep 28, 2019 at 10:56:10AM +0900, Akira Yokosawa wrote:
>> Subject: [PATCH 0/6] ppcmem: Apply new scheme of code snippets
>>
>> Hi Paul,
>>
>> This patch series mostly consists of code snippet updates in
>> formal/ppcmem.tex.
>>
>> Patch #1 fixes a trivial typo in dyntickrcu.
>> Patch #2 is the main changes in this series. It also employs
>> "cleveref" way of cross references.
>>
>> Patches #3--#6 touches the text and add a couples of references
>> to PowerPC atomic updates in the Linux kernel.
>>
>> Patch #3 adds entries in bib/swtools
>> Patch #4 adds citation of Git commit in 2013
>> Patches #5 and #6 add a Quick Quiz on another missing full memory
>> barrier in the beginning. I'm not that sure the added Quick Quiz
>> makes sense, though. If it doesn't, please skip #5 and #6.
> 
> I believe that the additional Quick Quiz is worthwhile, but I felt
> the need to edit it a bit.  I have queued and pushed the result.
> Could you please double-check it?

As always, your edit looks perfect to me!

> 
> And good stuff, thank you!
> 
> 							Thanx, Paul
> 
>> I remember asking you about the difference of the code emitted by
>> an atomic built-in of PowerPC-GCC and the code in Linux kernel [1].
>> IIUC, the added references and Quick Quiz are related to the
>> question.
>>
>> [1]: https://www.spinics.net/lists/perfbook/msg02077.html
>>
>> Seeing the history of the changes and your answer to [1], I suspect
>> that now that PPC_ATOMIC_ENTRY_BARRIER is "sync", "isync" might be
>> sufficient for PPC_ATOMIC_EXIT_BARRIER. Obviously I'm not an expert
>> of PowerPC and can be missing something, but I couldn't help
>> mentioning.

Now I think I finally understand that PPC_ATOMIC_EXIT_BARRIER needs to
be "sync".

Semantics of __ATOMIC_SEQ_CST of GCC's atomic built-in:

__ATOMIC_SEQ_CST:

    Enforces total ordering with all other __ATOMIC_SEQ_CST operations. 

OTOH, Linux kernel's value-returning atomic RMW operations need to be
strongly ordered from any observer.  So their semantics are different.

        Thanks, Akira

>>
>>         Thanks, Akira
>> --
>> Akira Yokosawa (6):
>>   dyntickrcu: Fix trivial typo
>>   ppcmem: Apply new scheme of code snippets
>>   bib/swtools: Add refereneces to PowerPC atomic RMW fixes
>>   ppcmem: Cite Git commit of PowerPC atomic_xxx_return fix
>>   ppcmem: Add Quick Quiz on lwsync in Listing 12.23
>>   ppcmem: Move final sentence of Answer to QQZ 12.27 to the next
>>
>>  bib/swtools.bib       |  33 +++++++
>>  formal/dyntickrcu.tex |   2 +-
>>  formal/ppcmem.tex     | 210 +++++++++++++++++++++++-------------------
>>  3 files changed, 149 insertions(+), 96 deletions(-)
>>
>> -- 
>> 2.17.1
>>

