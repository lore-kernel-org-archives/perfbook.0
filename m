Return-Path: <SRS0=cfv5=E3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gROqHjr6IO4k90Ho1gWRzom4psB8agzkXBKaYO8YeSI=;
        b=myzi+5kY2dEvm7FiphSRChJYv4Wko8MeNFJTZNccgZ51xG4ta3z+gTn6Az8ZGPgzaU
         QOQMgrw89CROuQvNBFz5/yS2ZCXlua3mMlj2jgpCrgqaZ8iRwphZNBVTBppWzeRbRIo0
         0V2Nunr17PCniZA/k1z9k+ogoYs6mxmikR9Bo2J7LCez+8k51914G28L7C9KZN62TJYe
         w0l0w0IJvIGagx9Zgl6hPc1j3P7i1HY5amO+uMZunSnczY5Jikw68YPlynPkI33Xf5A6
         YAeDjmODiWIfRQPOT5BbbAn/IhgvaAyqxqjbnzV1h72rykdQrBmzPhkRnaUSi9YFjzs5
         JkhQ==
Subject: Re: [PATCH perfbook 0/2] CodeSamples/formal: Cleanup of init blocks
 in litmus tests
References: <7e9cc3fb-12af-eb3c-2d81-74486dd9e061@gmail.com>
 <20201115204244.GM3249@paulmck-ThinkPad-P72>
 <55d8594a-048d-15f3-b3fc-36ca6594545e@gmail.com>
 <20201121011410.GT1437@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e02925ab-7a11-ad79-b87f-ef3ed969a369@gmail.com>
Date: Sat, 21 Nov 2020 11:51:11 +0900
MIME-Version: 1.0
In-Reply-To: <20201121011410.GT1437@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 20 Nov 2020 17:14:10 -0800, Paul E. McKenney wrote:
> On Mon, Nov 16, 2020 at 07:25:09AM +0900, Akira Yokosawa wrote:
>> On Sun, 15 Nov 2020 12:42:44 -0800, Paul E. McKenney wrote:
>>> On Sat, Nov 14, 2020 at 01:51:01PM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> This patch set is what I mentioned the other day in response to
>>>> your LKMM patch for 5.11.
>>>> klitmus7 doesn't need most of type info in litmus-test init blocks.
>>>>
>>>> While there are some cases where klitmus7 requires type info of variables
>>>> to be watched (via the "exists", "locations", or "filter" directive),
>>>> as long as the watched variables are of type "int", extra type info
>>>> in the init block is not required.
>>>>
>>>> Litmus tests under CodeSamples/formal/ should keep compatible with
>>>> klitmus7 after this patch set is applied.
>>>>
>>>> Patch 1/2 removes initialization to 0 and type info of "int" or "int *"
>>>> under CodeSamples/formal/litmus/.
>>>>
>>>> Patch 2/2 further reduce line counts of litmus tests by using "{}"
>>>> as empty init blocks.
>>>> It also adds/removes empty lines for those code snippets to have
>>>> consistent looks.
>>>>
>>>> Similar changes to patch 1/2 can be made in the RCU litmus tests
>>>> presented in Section 12.3.2. They are not touched in this patch set.
>>>>
>>>> May be in a follow-up patch.
>>>
>>> Queued and pushed, thank you very much!
>>>
>>>>         Thanks, Akira
>>>>
>>>> *NOTE*:
>>>>
>>>> There are cases where litmus tests for herd7 can not be
>>>> made compatible with (current) klitmus7, though.
>>>>
>>>> One such example is when a variable of a type other than the "int"
>>>> or "int *" (such as "spinlock_t") is specified in the "locations" or "filter"
>>>> directive.
>>>> Current klitmus7 has no idea of the way to obtain the value of such a
>>>> variable.
>>>
>>> Good to know!  Do we have litmus tests that have problems with this?
>>
>> One such litmus test can be made up based on CodeSamples/formal/herd/C-Lock1.litmus
> 
> So there is not currently such a litmus test in perfbook, but one could
> easily be created, correct?

You are right!

        Thanks, Akira

PS.

I'm preparing a patch series to add an index framework in perfbook.
My plan is to add a specific make target for the time being to have such
index pages printed.
As you should know, the hard part is to embed a *lot* of index annotations
in .tex source files.

I'm thinking of splitting indexes into a general one and API index.
By API, I mean functions such as smp_mb(), READ_ONCE(), etc.

API index can have kernel API, perfbook specific API, C11 API, and GCC API.

As for words/terms, if you can provide me a wish list you'd like to see in
the general index, I'm willing to add such annotations.
My starting point of the general index is the Glossary.

Thoughts? 

> 
> Or am I still confused?  ;-)
> 
> 							Thanx, Paul
> 
>> ---
>> C Lock1-for-herd7
>>
>> (*
>>  * Example test incompatible with klitmus7
>>  *
>>  * klitmus7 cannot access spinlock_t variable.
>>  *)
>>
>> {}
>>
>> P0(int *x, spinlock_t *sp)
>> {
>> 	spin_lock(sp);
>> 	WRITE_ONCE(*x, 1);
>> 	WRITE_ONCE(*x, 0);
>> 	spin_unlock(sp);
>> }
>>
>> P1(int *x, spinlock_t *sp)
>> {
>> 	int r1;
>>
>> 	spin_lock(sp);
>> 	r1 = READ_ONCE(*x);
>> 	spin_unlock(sp);
>> }
>>
>> locations [sp]    (* incompatible with klitmus7 *)
>> exists (1:r1=1)
>> ---
>>
>> klitmus7 can't convert this to a kernel module:
>>
>> ---
>> $ klitmus7 -o temp C-Lock1-for-herd7.litmus
>> File "C-Lock1-for-herd7.litmus" Parameter sp, type mismatch int vs. spinlock_t
>> ---
>>
>> Actually, herd7/LKMM does complain of this one:
>>
>> ---
>> Test Lock1-for-herd7 Allowed
>> States 1
>> 1:r1=0; sp=0;
>> No
>> Witnesses
>> Positive: 0 Negative: 2
>> Flag lock-final                          <---
>> Condition exists (1:r1=1)
>> Observation Lock1-for-herd7 Never 0 2
>> Time Lock1-for-herd7 0.01
>> Hash=5d10e6c355cec0c36f354abf175adc54
>> ---
>>
>> Comment at line 57 of lock.cat says:
>>
>> ---
>> (* The final value of a spinlock should not be tested *)
>> flag ~empty [FW] ; loc ; [ALL-LOCKS] as lock-final
>> ---
>>
>>         Thanks, Akira
>>

[...]
