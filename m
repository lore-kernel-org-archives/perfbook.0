Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+KaIhcOPW1rWQszHnzfTWJ0N4ru4GqqeGES+Z4No8aE=;
 b=N1kJxJfYiaMRlotFqAY8u5tC5Mf4HfkMsAf6UGC5fFhIoW1OesUO7U/3GslFhKz+mg
 9DaKCtEbdhtpzX+a/mwNuesZs5XmWxcvQUWpD3z2dxi9ex61d208b4U6sIVfZKXwxPGU
 BUwYlwFjMUPsOf4R/VKUQIQBb3qQ8tnfb3oRuDNX9KAOkBWEL52Bes0Mtafktkpz7Ipg
 lwOiKm+AniWVFKmrqfaI6kC5AlnIuSc+Sl8Nbq4J2cjsquD1lUEhbD+GUx/UQDapOLpF
 Z7Pyxah5Ew5BMCxY8S8QWkgKsAjNBloGcdnNnLRaYgUMekzVryCdw3WB76/jm1rb2Uux
 DXqw==
Subject: Re: [PATCH 0/2] litmus test updates
References: <0f7d5b71-c960-6462-fc45-a83f757d88ee@gmail.com>
 <20170709192655.GW2393@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8dffe40e-0dd0-0f55-0696-5e0bca83582b@gmail.com>
Date: Tue, 11 Jul 2017 07:14:24 +0900
MIME-Version: 1.0
In-Reply-To: <20170709192655.GW2393@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/07/09 12:26:55 -0700, Paul E. McKenney wrote:
> On Sun, Jul 09, 2017 at 10:39:46AM +0900, Akira Yokosawa wrote:
>> >From 955eefe8ad5a64fddd2e33b343ac3a1e171dd089 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 9 Jul 2017 09:53:28 +0900
>> Subject: [PATCH 0/2] litmus test updates
>>
>> Hi Paul,
>>
>> I thought that embedding kernel API definitions in each litmus test is
>> redundant. We can use #include instead. In this case, we need to
>> specify a -I option for gcc as the compilation is done in a temporally
>> directory. We can do so by using -ccopts option of litmus7.
>>
>> Patch 1 does this change.
> 
> You know, I tried this and it kept complaining about not finding the
> include file.  No idea what I was doing wrong, but whatever it was,
> thank you very much for getting it right!!!
> 
>> However, in native run on x86_64, I'm seeing a significant difference
>> in the resulting statistics.
>> Before the change, a typical result is:
>>
>>     Test C-SB+o-o+o-o Allowed
>>     Histogram (4 states)
>>     54    *>0:r2=0; 1:r2=0;
>>     49999628:>0:r2=2; 1:r2=0;
>>     49999697:>0:r2=0; 1:r2=2;
>>     621   :>0:r2=2; 1:r2=2;
>>     Ok
>>
>> After the change, the result is something like:
>>
>>     Test C-SB+o-o+o-o Allowed
>>     Histogram (4 states)
>>     26    *>0:r2=0; 1:r2=0;
>>     49999782:>0:r2=2; 1:r2=0;
>>     49999818:>0:r2=0; 1:r2=2;
>>     374   :>0:r2=2; 1:r2=2;
>>     Ok
>>
>> In cross compilation mode, the result is similar and consistent
>> with the native run after the change.
>> So I suspect litmus7's behavior of native run is affected by the
>> "-ccopts" option. Again, this might depend on the platform variation.
> 
> Between differences in compilers, compiler options, and hardware,
> we should expect quite a bit of of variation.  In fact, there are
> sometimes specific pieces of hardware that have much stronger
> memory ordering than the architecture guarantees.
> 
>> Patch 2 adds targets for cross compilation mode of litmus7.
>> Because we need to copy the custom header file "api.h" into the target
>> directory, I made the recipe to do so.
> 
> Looks good!
> 
>> I stopped short of adding recipes to make an archive and scp it to
>> remote host and to do remote compilation and execution via ssh.
>> They can be added later.
> 
> Your choice on this one.  ;-)
> 
>> On PPC, the result of C-SB+o-o+o-o.litmus looks interesting.
>> (Of course, you are familiar with PPC, but...)
>>
>>     Test C-SB+o-o+o-o Allowed
>>     Histogram (4 states)
>>     988335*>0:r2=0; 1:r2=0;
>>     49516879:>0:r2=2; 1:r2=0;
>>     49494779:>0:r2=0; 1:r2=2;
>>     7     :>0:r2=2; 1:r2=2;
>>     Ok
> 
> I am not surprised by this.  PPC tends to do more local processing for
> longer than x86 does, as an extremely rough rule of thumb.  PPC's weak
> ordering enables this.  So getting the outcome where both CPUs communicate
> with each other should be harder on PPC than on x86.
> 
>>     Witnesses
>>     Positive: 988335, Negative: 99011665
>>     Condition exists (1:r2=0 /\ 0:r2=0) is validated
>>     Hash=9bb70a6ed845b4be5f335c7eeb134f3f
>>
>> Note that I've not tested the result of "cross-arm" target actually
>> builds and runs on ARM hosts.
> 
> There are supposed to be places to get free access to ARM hardware.
> If you don't find one, let me know, and I will be happy to reach out
> to my contacts at ARM and Linaro.

Well, I tried Linaro Developer Cloud, but they are not accepting
requests of new instances. The request page says:

> Capacity reached
> Due to the very high levels of interest in Developer Cloud, we have
> temporarily reached our capacity limits. We are in the process of
> expanding our service but, in the meantime, we are currently not able
> to accept any more requests for instances. Once capacity is available
> again, the "Request Cloud Instance" option will be available again.

So I'm waiting the capacity to become available.
Are you aware of an alternative service?

BTW, I managed to have a (sporadic) access to an ARMv8 host yesterday.

I tried the result of "cross-arm" target, and it worked just fine.
However, "make" in other CodeSamples' sub-directories didn't go well,
I'm attempting to add support for arm64. If it works, I'll submit
a patch set.

       Thanks, Akira

>> How does this approach look like?
> 
> Quite nice!  I queued and pushed it, again, thank you!
> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> -- 
>> Akira Yokosawa (2):
>>   advsync: Use '#include "api.h"' in litmus tests
>>   advsync: Add cross compilation targets
>>
>>  CodeSamples/advsync/herd/.gitignore                |  5 ++++
>>  CodeSamples/advsync/herd/C-SB+o-mb-o+o-mb-o.litmus |  4 +--
>>  CodeSamples/advsync/herd/C-SB+o-o+o-o.litmus       |  3 +-
>>  CodeSamples/advsync/herd/Makefile                  | 34 ++++++++++++++++++++--
>>  CodeSamples/advsync/herd/api.h                     |  8 +++++
>>  5 files changed, 47 insertions(+), 7 deletions(-)
>>  create mode 100644 CodeSamples/advsync/herd/api.h
>>
>> -- 
>> 2.7.4
>>
> 
> 

